//
//  RebaTableViewCell.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/23.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RebaData.h"
@interface RebaTableViewCell : UITableViewCell

//头像
@property(nonatomic, strong) UIImageView *touXiang;
//话题
@property(nonatomic, strong) UILabel *huaTi;
//话题的内容
@property(nonatomic, strong) UILabel *huaTiNeiRong;

//下列放大
@property(nonatomic, strong) UIImageView*imageView1;

//订阅按钮
@property(nonatomic, strong) UIButton * button;

//订阅
@property(nonatomic, strong) UILabel *dingYue;
@property(nonatomic, strong) UILabel *dingYueShu;

//总贴
@property(nonatomic, strong) UILabel *zongTie;
@property(nonatomic, strong) UILabel *zongTieShu;


@property(nonatomic, strong) RebaData*model;
@end
