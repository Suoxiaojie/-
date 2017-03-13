//
//  RebaOneTableViewCell.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/28.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RebaOneData.h"

@interface RebaOneTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *touXiang;//头像

@property(nonatomic, strong) UILabel *name;//名字

@property(nonatomic, strong) UILabel *FaBiaoDT;//发表的动态

@property(nonatomic, strong) UIImageView *neiRong;//内容位置




@property(nonatomic, strong) UIButton *dianZan;//点赞
@property(nonatomic, strong) UILabel *dianZanShu;//点赞数量

@property(nonatomic, strong) UIButton *juZan;//拒赞
@property(nonatomic, strong) UILabel *juZanShu;//拒赞数量

@property(nonatomic, strong) UIButton *pingLuo;//评论
@property(nonatomic, strong) UILabel *pingLuoShu;//评论数量

@property(nonatomic, strong) UIButton *zhuanFa;//转发
@property(nonatomic, strong) UILabel *zhuanFaShu;//转发数量

@property(nonatomic, strong)RebaOneData*model;


@end
