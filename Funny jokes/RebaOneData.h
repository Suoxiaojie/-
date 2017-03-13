//
//  RebaOneData.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/28.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RebaOneData : NSObject

@property(nonatomic, copy) NSString *touXiang;//头像

@property(nonatomic, copy) NSString *name;//名字

@property(nonatomic, copy) NSString *FaBiaoDT;//发表的动态

@property(nonatomic, copy) NSString *neiRongTP;//内容图片

@property(nonatomic, copy) NSString *neiRongSP;//内容视频

@property(nonatomic, copy) NSString *neiRongWZ;//内容文字


@property(nonatomic, copy) NSString *dianZan;//点赞
@property(nonatomic, copy) NSNumber *dianZanShu;//点赞数量

@property(nonatomic, copy) NSString *juZan;//拒赞
@property(nonatomic, copy) NSNumber *juZanShu;//拒赞数量

@property(nonatomic, copy) NSString *pingLuo;//评论
@property(nonatomic, copy) NSNumber *pingLuoShu;//评论数量

@property(nonatomic, copy) NSString *zhuanFa;//转发
@property(nonatomic, copy) NSNumber *zhuanFaShu;//转发数量

@property(nonatomic, assign) NSInteger type1;//广告类型

@property(nonatomic, assign) NSInteger category_id;

@end
