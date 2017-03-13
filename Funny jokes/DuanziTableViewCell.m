//
//  DuanziTableViewCell.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/17.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "DuanziTableViewCell.h"
#import <SDAutoLayout.h>
#import <SDWebImage/UIImageView+WebCache.h>
@implementation DuanziTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
        
        _avatar_url=[[UIImageView alloc]init];
        _avatar_url.layer.cornerRadius=20;
        _avatar_url.layer.masksToBounds=YES;
        [self.contentView addSubview:self.avatar_url];
        
        
        _name=[[UILabel alloc]init];
        _name.font=[UIFont systemFontOfSize:16];
        _name.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.name];
        
        _text=[[UILabel alloc]init];
        _text.font=[UIFont systemFontOfSize:20];
        _text.textColor=[UIColor grayColor];
        [self.contentView addSubview:self.text];
                
        _dianzan=[[UIButton alloc]init];
        [_dianzan setBackgroundImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
        [_dianzan setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.dianzan];
        
        
        _digg_count=[[UILabel alloc]init];
        _digg_count.font=[UIFont systemFontOfSize:12];
        _digg_count.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.digg_count];
        
        _juzan=[[UIButton alloc]init];
        [_juzan setBackgroundImage:[UIImage imageNamed:@"juzan"] forState:UIControlStateNormal];
        [_juzan setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.juzan];
        
        _bury_count=[[UILabel alloc]init];
        _bury_count.font=[UIFont systemFontOfSize:12];
        _bury_count.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.bury_count];
        
        _pingluo=[[UIButton alloc]init];
        [_pingluo setBackgroundImage:[UIImage imageNamed:@"pinglun"] forState:UIControlStateNormal];
        [_pingluo setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.pingluo];
        
        _comment_count=[[UILabel alloc]init];
        _comment_count.font=[UIFont systemFontOfSize:12];
        _comment_count.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.comment_count];
        
        _zhuangfa=[[UIButton alloc]init];
        [_zhuangfa setBackgroundImage:[UIImage imageNamed:@"zhuanfa"] forState:UIControlStateNormal];
        [_zhuangfa setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.zhuangfa];
        
        _share_count=[[UILabel alloc]init];
        _share_count.font=[UIFont systemFontOfSize:12];
        _share_count.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.share_count];

        
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
        
        
        _text.sd_layout
        .topSpaceToView(self.avatar_url,10)
        .leftSpaceToView(self.contentView,30)
        .rightSpaceToView(self.contentView,30)
        .autoHeightRatio(0);
        
        _dianzan.sd_layout
        .topSpaceToView(self.text,20)
        .leftEqualToView(self.text)
        .widthIs(30)
        .heightIs(30);
        
        
        _digg_count.sd_layout
        .topSpaceToView(self.text,30)
        .leftSpaceToView(self.dianzan,4)
        .widthIs(50)
        .autoHeightRatio(0);
        
        _juzan.sd_layout
        .topSpaceToView(self.text,20)
        .leftSpaceToView(self.digg_count,10)
        .widthIs(30)
        .heightIs(30);
        
        
        _bury_count.sd_layout
        .topSpaceToView(self.text,30)
        .leftSpaceToView(self.juzan,4)
        .widthIs(50)
        .autoHeightRatio(0);
        
        
        _pingluo.sd_layout
        .topSpaceToView(self.text,20)
        .leftSpaceToView(self.bury_count,10)
        .widthIs(30)
        .heightIs(30);
        
        
        _comment_count.sd_layout
        .topSpaceToView(self.text,30)
        .leftSpaceToView(self.pingluo,4)
        .widthIs(50)
        .autoHeightRatio(0);
        
        _share_count.sd_layout
        .topSpaceToView(self.text,30)
        .rightSpaceToView(self.contentView,10)
        .widthIs(80)
        .autoHeightRatio(0);
        
        _zhuangfa.sd_layout
        .topSpaceToView(self.text,20)
        .rightSpaceToView(self.share_count,10)
        .widthIs(30)
        .heightIs(30);

        
//        [self setupAutoHeightWithBottomView:_zhuangfa bottomMargin:10];
        [self setupAutoHeightWithBottomViewsArray:@[_dianzan,_digg_count,_juzan,_bury_count,_pingluo,_comment_count,_share_count,_zhuangfa] bottomMargin:10];
        
    }
    
    return self;
}


-(void)setModel:(DuanziData *)model {
    
    [self.avatar_url sd_setImageWithURL:[NSURL URLWithString:model.avatar_url] placeholderImage:[UIImage imageNamed:@""]];
    self.name.text=model.name;
    
    self.text.text=model.text;
    
    self.digg_count.text = [NSString stringWithFormat:@"%@",model.digg_count];
    self.bury_count.text = [NSString stringWithFormat:@"%@",model.bury_count];
    self.comment_count.text = [NSString stringWithFormat:@"%@",model.comment_count];
    self.share_count.text = [NSString stringWithFormat:@"%@",model.share_count];
}

@end
