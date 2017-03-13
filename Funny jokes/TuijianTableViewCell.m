//
//  TuijianTableViewCell.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/18.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "TuijianTableViewCell.h"
#import <SDAutoLayout.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Tuijian.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TuijianData.h"

@interface TuijianTableViewCell ()

@end

@implementation TuijianTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
            
            [self setUpView];
    }
    
    return self;
}

- (void)setUpView {
    
    _avatar_url=[[UIImageView alloc]init];
    _avatar_url.layer.cornerRadius=20;
    _avatar_url.layer.masksToBounds=YES;
    [self.contentView addSubview:self.avatar_url];
    
    
    _name=[[UILabel alloc]init];
    _name.font=[UIFont systemFontOfSize:14];
    _name.textColor=[UIColor blackColor];
    [self.contentView addSubview:self.name];
    
    _title=[[UILabel alloc]init];
    _title.font=[UIFont systemFontOfSize:18];
    _title.textColor=[UIColor blackColor];
    [self.contentView addSubview:self.title];
    
    _category_name=[[UILabel alloc] init];
    _category_name.font=[UIFont systemFontOfSize:18];
    _category_name.textAlignment=NSTextAlignmentCenter;
    
    
    _category_name.layer.borderWidth=2;
    _category_name.layer.cornerRadius=18;
    _category_name.textColor=[UIColor redColor];
    [self.contentView addSubview:self.category_name];
    
    
    //        _button=[[UIButton alloc]init];
    //        [_button setBackgroundImage:[UIImage imageNamed:@"播放按钮"] forState:UIControlStateNormal];
    //        [_button addTarget:self action:@selector(BoFang) forControlEvents:UIControlEventTouchUpInside];
    //        [self.contentView addSubview:self.button];
    
    
    
    _neirong=[[UIImageView alloc]init];
    [self.contentView addSubview:self.neirong];
    
    
    
    
    _digg_countBtn=[[UIButton alloc]init];
    [_digg_countBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _digg_countBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_digg_countBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.digg_countBtn];
    
    _bury_countBtn=[[UIButton alloc]init];
    [_bury_countBtn setTintColor:[UIColor blackColor]];
    [_bury_countBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _bury_countBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_bury_countBtn setImage:[UIImage imageNamed:@"juzan"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.bury_countBtn];
    
    _comment_countBtn=[[UIButton alloc]init];
    [_comment_countBtn setTintColor:[UIColor blackColor]];
    [_comment_countBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _comment_countBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_comment_countBtn setImage:[UIImage imageNamed:@"pinglun"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.comment_countBtn];
    
    _share_countBtn=[[UIButton alloc]init];
    [_share_countBtn setTintColor:[UIColor blackColor]];
    [_share_countBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _share_countBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_share_countBtn setImage:[UIImage imageNamed:@"zhuanfa"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.share_countBtn];
    
}

- (void)layoutViews:(TuijianData_data_data_group *)model {
    
    
    _avatar_url.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,5)
    .widthIs(40)
    .heightIs(40);
    
    
    _name.sd_layout
    .topSpaceToView(self.contentView,15)
    .leftSpaceToView(self.avatar_url,5)
    .widthIs(200)
    .autoHeightRatio(0);
    
    _title.sd_layout
    .topSpaceToView(self.avatar_url,10)
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    
    _category_name.sd_layout
    .topSpaceToView(self.title,5)
    .leftEqualToView(self.title)
    .widthIs(120)
    .heightIs(30);
    
    
//            _button.sd_layout
//            .leftSpaceToView(self.contentView,100)
//            .rightSpaceToView(self.contentView,190)
//            .topSpaceToView(self.title,100)
//            .widthIs(50)
//            .heightIs(50);
    
    if (!model.url && !model.mp4_url) {
        _neirong.sd_layout
        .topSpaceToView(self.category_name,0)
        .leftSpaceToView(self.contentView,0)
        .rightSpaceToView(self.contentView,0)
        .heightIs(0);
        

    } else {
        
        _neirong.sd_layout
        .topSpaceToView(self.category_name,10)
        .leftSpaceToView(self.contentView,0)
        .rightSpaceToView(self.contentView,0)
        .heightIs(400);
    }
    
    
    
    _digg_countBtn.sd_layout
    .topSpaceToView(self.neirong,10)
    .leftSpaceToView(self.contentView,0)
    .widthRatioToView(self.contentView,0.25)
    .heightIs(40);
    
    _bury_countBtn.sd_layout
    .topSpaceToView(self.neirong,10)
    .leftSpaceToView(self.digg_countBtn,0)
    .widthRatioToView(self.contentView,0.25)
    .heightIs(40);
    
    _comment_countBtn.sd_layout
    .topSpaceToView(self.neirong,10)
    .leftSpaceToView(self.bury_countBtn,0)
    .widthRatioToView(self.contentView,0.25)
    .heightIs(40);
    
    _share_countBtn.sd_layout
    .topSpaceToView(self.neirong,10)
    .leftSpaceToView(self.comment_countBtn,0)
    .widthRatioToView(self.contentView,0.25)
    .heightIs(40);
    
    
    
    [self setupAutoHeightWithBottomViewsArray:@[_digg_countBtn,_bury_countBtn,_comment_countBtn,_share_countBtn] bottomMargin:10];
}

- (void)setModel:(TuijianData_data_data_group *)model {
    
    _model = model;
    [self layoutViews:model];
    
    _name.text = model.name;
    _title.text = model.text;
    _category_name.text = model.category_name;
    [_neirong sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:[UIImage imageNamed:@""]];
    [_avatar_url sd_setImageWithURL:[NSURL URLWithString:model.avatar_url] placeholderImage:[UIImage imageNamed:@""]];
    [_digg_countBtn setTitle:[NSString stringWithFormat:@"%@",model.digg_count] forState:UIControlStateNormal];
    [_bury_countBtn setTitle:[NSString stringWithFormat:@"%@",model.bury_count] forState:UIControlStateNormal];
    [_comment_countBtn setTitle:[NSString stringWithFormat:@"%@",model.comment_count] forState:UIControlStateNormal];
    [_share_countBtn setTitle:[NSString stringWithFormat:@"%@",model.share_count] forState:UIControlStateNormal];
    
    
}




@end
