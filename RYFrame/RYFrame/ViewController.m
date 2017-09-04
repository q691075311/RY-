//
//  ViewController.m
//  RYFrame
//
//  Created by taobo on 17/8/24.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import <CoreData/CoreData.h>
#import "RYCoreDataManage.h"
#import "classModel.h"
@interface ViewController ()
@property (nonatomic,strong) NSManagedObjectContext *coreDataManageContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    _coreDataManageContext = [RYCoreDataManage shareCoreManage].managedObjectContext;
    // Do any additional setup after loading the view, typically from a nib.
    
//    Student * stu = [[Student alloc] init];
//    Student * stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:_coreDataManageContext];
    
//    classModel * mo = [[classModel alloc] init];
//    stu.name = @"肯定";
//    stu.age = @(44);
//    stu.iD = @(11);
//    [_coreDataManageContext save:nil];
//    [[RYCoreDataManage shareCoreManage] coreDataAddDataWithTableName:@"Student" WithObject:mo];
//    Student * st = arr[0];
//    NSLog(@"%@",st.name);
//    [[RYCoreDataManage shareCoreManage] queryCoreDataWithEntityName:@"Student" withCompele:^(NSArray *arr,NSError * error) {
//        
//    }];
    
//    Student * st = [[RYCoreDataManage shareCoreManage] coreDataQueryDataWithEntityName:@"Student" withPredicate:@"name"][0];
//    NSArray * arr = [[RYCoreDataManage shareCoreManage] coreDataQueryDataWithEntityName:@"Student" withConditions:@"肯定" withValue:@"name"];
//    NSLog(@"%@",((Student * )arr[0]).name);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
