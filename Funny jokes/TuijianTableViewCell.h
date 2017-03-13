//
//  TuijianTableViewCell.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/18.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuijianData.h"

@interface TuijianTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView*avatar_url;

@property(nonatomic,strong)UILabel*name;

@property(nonatomic,strong)UILabel*title;



@property(nonatomic,strong)UIImageView*neirong;




//搞笑视频  按钮
@property(nonatomic,strong)UILabel*category_name;

@property(nonatomic,strong)UIButton* button;



// 点赞
@property(nonatomic, strong)UIButton*digg_countBtn;

// 拒赞
@property(nonatomic, strong)UIButton*bury_countBtn;

// 评论
@property(nonatomic, strong)UIButton*comment_countBtn;


// 转发
@property(nonatomic, strong)UIButton*share_countBtn;


@property(nonatomic,strong)TuijianData_data_data_group*model;


//声明


@end
