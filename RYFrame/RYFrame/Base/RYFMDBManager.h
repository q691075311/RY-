//
//  RYFMDBManager.h
//  RYFrame
//
//  Created by taobo on 2017/9/5.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"


@interface RYFMDBManager : NSObject
@property (nonatomic,strong)FMDatabase * db;
@property (nonatomic,strong)FMDatabaseQueue * dbQueue;//线程安全实例
/**
 *  单例化FMDB
 */
+ (RYFMDBManager *)shareFMDBManager;
/**
 *  插入数据
 */
- (BOOL)insertDate;
/**
 *  事务操作
 */
- (void)transaction;
/**
 *  查询表数据
 */
- (void)queryTableDate;

@end
