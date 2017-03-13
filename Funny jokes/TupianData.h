//
//  TupianData.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/17.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TupianData : NSObject

//头像
@property(nonatomic, copy)  NSString*avatar_url;

//用户名字
@property(nonatomic, copy) NSString *name;


//内容
@property(nonatomic, copy) NSString *text;

//图片
@property(nonatomic, copy) NSString *url;

//点赞
@property(nonatomic, copy) NSNumber *digg_count;

//绝赞
@property(nonatomic, copy) NSNumber *bury_count;

//评论
@property(nonatomic, copy) NSNumber *comment_count;

//转发
@property(nonatomic, copy) NSNumber *share_count;




@end
