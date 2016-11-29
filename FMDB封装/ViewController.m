//
//  ViewController.m
//  FMDB封装
//
//  Created by 周鹏 on 2016/11/25.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "ViewController.h"
#import "YZKDBTool.h"
#import "Json+Dic.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

       //创建数据库
    FMDatabase *dataBase = [[YZKDBTool tool]getDBWithDBName:@"userName.sqlite"];
    [[YZKDBTool tool]getDBWithDBName:@"userName.sqlite"];
    [[YZKDBTool tool]getDBWithDBName:@"userName.sqlite"];
    [[YZKDBTool tool]DataBase:dataBase createTable:@"nameA" keyTypes:@{@"key":@"text"}];
    [[YZKDBTool tool]DataBase:dataBase createTable:@"nameB" keyTypes:@{@"key":@"text"}];

//    [[YZKDBTool tool]DataBase:dataBase insertKeyValues:@{@"key":@"啊啊"} intoTable:@"nameA"];
        [[YZKDBTool tool]clearDatabase:dataBase from:@"nameA"];

        [[YZKDBTool tool]clearDatabase:dataBase from:@"nameB"];


    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"today is good",@"content",@"2016.5.12",@"data", nil];
    for (int i = 0; i < 50; i++) {
        [[YZKDBTool tool]DataBase:dataBase insertKeyValues:@{@"key":[Json_Dic ToJsonWithDic:dic]} intoTable:@"nameA"];
    }
    for (int i = 0; i < 60; i++) {
        [[YZKDBTool tool]DataBase:dataBase insertKeyValues:@{@"key":[NSString stringWithFormat:@"value%d",i]} intoTable:@"nameB"];
    }
    
    //查询
   NSArray *arr = [[YZKDBTool tool]DataBase:dataBase selectKeyTypes:@{@"key":@"text"} fromTable:@"nameA"];
    NSLog(@"%@",arr);


    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
