//
//  RebaData.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/23.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "RebaData.h"

@implementation RebaData

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"iid"];
    }
}

@end

@implementation RebaData_xiala

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
