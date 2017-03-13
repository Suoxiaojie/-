//
//  ShipingData.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/16.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShipingData_data;
@class ShipingData_data_data;
@class ShipingData_data_data_group;

@interface ShipingData : NSObject
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) NSDictionary *data;
@end//第一层

@interface ShipingData_data : NSObject
@property(nonatomic, copy) NSArray *data;
@end//第二层

@interface ShipingData_data_data : NSObject
@property(nonatomic, copy) NSDictionary *group;
@property(nonatomic, assign) NSInteger type;
@end//第三层

@interface ShipingData_data_data_group : NSObject
@property(nonatomic, copy) NSString *mp4_url;//视频链接
@property(nonatomic, copy) NSString *text;//发表的动态
@property(nonatomic, copy) NSString *category_name;//搞笑视频  类型
@property(nonatomic, strong) NSNumber *digg_count;  
@property(nonatomic, strong) NSNumber *bury_count;
@property(nonatomic, strong) NSNumber *comment_count;
@property(nonatomic, strong) NSNumber *share_count;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *avatar_url;
@property(nonatomic, copy) NSString *url;

@property(nonatomic, copy) NSDictionary *user;
@property(nonatomic, copy) NSDictionary *large_cover;


@end

//// 头像
//@property(nonatomic, strong) NSDictionary *user;
//
//
//@property(nonatomic, copy) NSString *avatar_url;
//
//@property(nonatomic, copy) NSString *name;
//
//// 发表的话
//@property(nonatomic, copy) NSString *text;
//
//
//@property(nonatomic, strong) NSDictionary *large_cover;
//@property(nonatomic, copy) NSArray *url_list;
//
//
//@property(nonatomic, copy) NSDictionary *p_video;
//@property(nonatomic, copy) NSString *uri;
//
//@property(nonatomic, copy) NSString *mp4_url;
//
//// 图片
//@property(nonatomic, copy) NSString *url;
//
//// 点赞
//@property(nonatomic, strong) NSNumber *digg_count;
//
//// 拒赞
//@property(nonatomic, strong) NSNumber *bury_count;
//
//// 评论
//

//
//// 转发
//@property(nonatomic, strong) NSNumber *share_count;
//
//// 网址链接
//@property(nonatomic, copy) NSString *share_url;



