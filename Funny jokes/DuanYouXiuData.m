//
//  DuanYouXiuData.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/24.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "DuanYouXiuData.h"

@implementation DuanYouXiuData

-(void)setValue:(id)value forKey:(NSString *)key{
    
    if ([key isEqualToString:@"360p_video"]) {
        [self setValue:value forKey:@"p_video"];
    }
}

@end
