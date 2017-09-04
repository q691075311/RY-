//
//  RYCoreDataManage.h
//  RYFrame
//
//  Created by taobo on 2017/8/28.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface RYCoreDataManage : NSObject

//block声明
typedef void(^compele)(NSArray *arr,BOOL is);

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
+ (instancetype)shareCoreManage;
/**
 *  添加一条新数据
 *
 *  @param tableName 实体类名
 *  @param object    新数据对象
 */
- (void)coreDataAddDataWithTableName:(NSString *)tableName WithObject:(id)object;
/**
 *  查询实体类所有的数据
 *
 *  @param entityName 实体类名
 */
- (void)queryCoreDataWithEntityName:(NSString *)entityName withCompele: (void(^)(NSArray *arr,NSError * error))compele;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
