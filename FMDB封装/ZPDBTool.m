//
//  ZPDBTool.m
//  FMDB封装
//
//  Created by zhoupeng on 2016/11/30.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "ZPDBTool.h"
static ZPDBTool *tool = nil;

@implementation ZPDBTool
+(ZPDBTool *)tool

{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        if (tool == nil) {
            
            tool = [[self alloc] init];
            
        }
        
    });
    
    return tool;
    
}
//覆盖alloc方法
+(instancetype)allocWithZone:(struct _NSZone *)zone

{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        if (tool == nil) {
            
            tool = [super allocWithZone:zone];
            
        }
        
    });
    
    return tool;
    
}

-(FMDatabase *)getDBWithDBName:(NSString *)dbName
{
    //1.获得数据库文件的路径
    NSString *doc =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)  lastObject];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/%@.sqlite",doc,dbName];
    
    //2.获得数据库
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    
    //3.使用如下语句，如果打开失败，可能是权限不足或者资源不足。通常打开完操作操作后，需要调用 close 方法来关闭数据库。在和数据库交互 之前，数据库必须是打开的。如果资源或权限不足无法打开或创建数据库，都会导致打开失败。
    if ([db open])
    {
        //4.创表
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREM ENT, name text NOT NULL, age integer NOT NULL);"];
        if (result)
        {
            NSLog(@"创建表成功");
        }
        return db;
    }else
    {
        NSLog(@"无法获取数据库");
        
        return nil;
    }

}


@end
