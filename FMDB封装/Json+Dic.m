//
//  Json+Dic.m
//  FMDB封装
//
//  Created by 周鹏 on 2016/11/25.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "Json+Dic.h"

@implementation Json_Dic
+(NSString *)ToJsonWithDic:(NSDictionary *)dic
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    return jsonString;
}
@end
