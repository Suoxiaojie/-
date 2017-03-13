//
//  ShipingTableViewCell.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/16.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShipingData.h"

@interface ShipingTableViewCell : UITableViewCell


@property(nonatomic,strong)UIImageView*avatar_url;//头像

@property(nonatomic,strong)UILabel*name;//名字

// 发表的话
@property(nonatomic, strong) UILabel *text;

// 图片
@property(nonatomic, strong) UIImageView *url;

// 点赞
@property(nonatomic, strong)UIButton*dianzan;
@property(nonatomic, strong) UILabel *digg_count;

// 拒赞
@property(nonatomic, strong)UIButton*juzan;
@property(nonatomic, strong) UILabel *bury_count;

// 评论
@property(nonatomic, strong)UIButton*pingluo;
@property(nonatomic, strong) UILabel *comment_count;

// 转发
@property(nonatomic, strong)UIButton*zhuangfa;
@property(nonatomic, strong) UILabel *share_count;


@property(nonatomic,strong)ShipingData_data_data_group*model;





@end
