//
//  ZPDBTool.h
//  FMDB封装
//
//  Created by zhoupeng on 2016/11/30.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface ZPDBTool : NSObject
/**
 
 *  数据库工具单例
 
 *
 
 *  @return 数据库工具对象
 
 */

+(ZPDBTool *)tool;

/**
 
 *  创建数据库
 
 *
 
 *  @param dbName 数据库名称(自动带后缀.sqlite)
 
 */

-(FMDatabase *)getDBWithDBName:(NSString *)dbName;
@end
