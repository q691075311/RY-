//
//  RYFMDBManager.m
//  RYFrame
//
//  Created by taobo on 2017/9/5.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "RYFMDBManager.h"

@implementation RYFMDBManager
static RYFMDBManager * DBM = nil;

+ (RYFMDBManager *)shareFMDBManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DBM = [[RYFMDBManager alloc] init];
        [DBM createFilePath];
    });
    return DBM;
}
- (void)createFilePath{
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * filePath = [path stringByAppendingPathComponent:@"FMDB.db"];
    NSLog(@"path-----%@",filePath);
    _db = [FMDatabase databaseWithPath:filePath];
    
    if ([_db open]) {
        NSLog(@"成功打开数据库");
        [self createTable];
    }else{
        NSLog(@"打开数据库失败");
    }
}
- (BOOL)createTable{
    NSString * sqlStr = @"create table mytable(num integer,name varchar(7),sex char(1),primary key(num));";
    BOOL res = [_db executeUpdate:sqlStr];
    if (res) {
        NSLog(@"table创建成功！！");
    }else{
        NSLog(@"table创建失败！！");
    }
    [_db close];
    return res;
}
- (BOOL)insertDate{
    [_db open];
    NSString * sqlStr = @"insert into mytable(num,name,sex) values(2,'liuting','m');";
    BOOL res = [_db executeUpdate:sqlStr];
    if (res) {
        NSLog(@"成功插入数据！！");
    }else{
        NSLog(@"插入数据失败！！");
    }
    [_db close];
    return res;
}

- (void)transaction{
    [_db open];
    //开启事务
    [_db beginTransaction];
    BOOL isRollBack = NO;
    @try {
        for (int i = 0; i < 50; i++) {
            NSNumber *num = @(i+5);
            NSString *name = [[NSString alloc] initWithFormat:@"student_%d",i];
            NSString *sex = (i%2==0)?@"f":@"m";
            NSString * sqlStr = @"insert into mytable(num,name,sex) values(?,?,?);";
            BOOL res = [_db executeUpdate:sqlStr,num,name,sex];
            if (!res) {
                NSLog(@"事务插入失败！！");
                return;
            }
        }
    } @catch (NSException *exception) {
        isRollBack = YES;
        //事务回退
        [_db rollback];
    } @finally {
        if (!isRollBack) {
            //事务提交
            [_db commit];
        }
    }
    [_db close];
}

- (void)queryTableDate{
    [_db open];
    NSString * sqlStr = @"SELECT * FROM mytable;";
    FMResultSet * res = [_db executeQuery:sqlStr];
    //打印错误信息
    if (!res) {
        NSLog(@"error=%@",[_db lastErrorMessage]);
    }
    //输出查询结果
    while ([res next]) {
        int totalCount = [res intForColumn:@"num"];
        NSLog(@"%d",totalCount);
    }
    [_db close];
}

@end


