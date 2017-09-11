//
//  ViewController.m
//  RYFrame
//
//  Created by taobo on 17/8/24.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "ViewController.h"
#import "RYFMDBManager.h"
#import "FMDB.h"

@interface ViewController ()
@property (nonatomic,strong) NSManagedObjectContext *coreDataManageContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
//    _coreDataManageContext = [RYCoreDataManage shareCoreManage].managedObjectContext;
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
//    NSString *class = @"class";
//    const char *className = [class cStringUsingEncoding:NSASCIIStringEncoding];
//    Class newClass = objc_getClass(className);
    
//    id destinationViewController = [[newClass alloc] init];
//    id destinationViewController1 = [[newClass alloc] init];
    
//    NSString * newstring = @"eeee";
//    char *new = [newstring cStringUsingEncoding:NSASCIIStringEncoding];
//    Class new1 = object_getClassName(new);
    
    RYFMDBManager * dbm = [RYFMDBManager shareFMDBManager];
    [dbm insertDate];
    [dbm transaction];
    [dbm queryTableDate];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor ry_colorWithHexString:@"#FFFF00"];
    [self.view addSubview:view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
