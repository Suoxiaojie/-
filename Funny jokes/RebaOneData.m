//
//  RebaOneData.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/28.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "RebaOneData.h"

@implementation RebaOneData

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"type"]) {
        [self setValue:value forKey:@"type1"];
    }
}

@end
