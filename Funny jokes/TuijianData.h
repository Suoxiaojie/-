//
//  TuijianData.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TuijianData_data;
@class TuijianData_data_data;
@class TuijianData_data_data_group;

@interface TuijianData : NSObject
@property(nonatomic, copy) NSDictionary *data;
@property(nonatomic, copy) NSString *message;
@end

@interface TuijianData_data : NSObject
@property(nonatomic, copy) NSArray *data;
@end

@interface TuijianData_data_data : NSObject
@property(nonatomic, copy) NSDictionary *group;
@property(nonatomic, assign) NSInteger type;
@end

@interface TuijianData_data_data_group : NSObject
@property(nonatomic, copy) NSString *name;              // 名字
@property(nonatomic, copy) NSString *avatar_url;        // 头像
@property(nonatomic, copy) NSString *url;               // 图片
@property(nonatomic, assign) NSNumber *digg_count;
@property(nonatomic, assign) NSNumber *share_count;
@property(nonatomic, assign) NSNumber *bury_count;
@property(nonatomic, assign) NSNumber *comment_count;
@property(nonatomic, copy) NSString *mp4_url;           // 视频链接
@property(nonatomic, copy) NSString *text;              // 发表文字
@property(nonatomic, copy) NSString *category_name;     // 搞笑视频 & 搞笑图片

@property(nonatomic, copy) NSDictionary *user;
@property(nonatomic, copy) NSDictionary *large_cover;   //
@property(nonatomic, copy) NSDictionary *large_image;   // 
@end

