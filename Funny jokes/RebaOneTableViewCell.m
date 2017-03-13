//
//  RebaOneTableViewCell.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/28.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "RebaOneTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDAutoLayout.h>
@implementation RebaOneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _touXiang=[[UIImageView alloc] init];
        _touXiang.layer.cornerRadius=20;
        _touXiang.layer.masksToBounds=YES;
        [self.contentView addSubview:self.touXiang];//头像
        
        
        _name=[[UILabel alloc] init];
        _name.font=[UIFont systemFontOfSize:18];
        _name.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.name];//名字
        
        
        _FaBiaoDT=[[UILabel alloc] init];
        _FaBiaoDT.font=[UIFont systemFontOfSize:16];
        _FaBiaoDT.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.FaBiaoDT];//发表动态
        
        
        _neiRong=[[UIImageView alloc]init];

        [self.contentView addSubview:self.neiRong];//内容位置
        
        
        _dianZan=[[UIButton alloc]init];
        [_dianZan setBackgroundImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
        [_dianZan setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.dianZan];//点赞
        
        
        _dianZanShu=[[UILabel alloc]init];
        _dianZanShu.font=[UIFont systemFontOfSize:12];
        _dianZanShu.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.dianZanShu];//点赞数量
        
        _juZan=[[UIButton alloc]init];
        [_juZan setBackgroundImage:[UIImage imageNamed:@"juzan"] forState:UIControlStateNormal];
        [_juZan setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.juZan];//拒赞
        
        _juZanShu=[[UILabel alloc]init];
        _juZanShu.font=[UIFont systemFontOfSize:12];
        _juZanShu.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.juZanShu];//拒赞数量
        
        _pingLuo=[[UIButton alloc]init];
        [_pingLuo setBackgroundImage:[UIImage imageNamed:@"pinglun"] forState:UIControlStateNormal];
        [_pingLuo setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.pingLuo];//评论
        
        _pingLuoShu=[[UILabel alloc]init];
        _pingLuoShu.font=[UIFont systemFontOfSize:12];
        _pingLuoShu.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.pingLuoShu];//评论数量
        
        _zhuanFa=[[UIButton alloc]init];
        [_zhuanFa setBackgroundImage:[UIImage imageNamed:@"zhuanfa"] forState:UIControlStateNormal];
        [_zhuanFa setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.zhuanFa];//转发
        
        _zhuanFaShu=[[UILabel alloc]init];
        _zhuanFaShu.font=[UIFont systemFontOfSize:12];
        _zhuanFaShu.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.zhuanFaShu];//转发数量
        
        
        _touXiang.sd_layout
        .topSpaceToView(self.contentView,10)
        .leftSpaceToView(self.contentView,5)
        .widthIs(40)
        .heightIs(40);
        
        
        _name.sd_layout
        .topSpaceToView(self.contentView,15)
        .leftSpaceToView(self.touXiang,5)
        .widthIs(200)
        .autoHeightRatio(0);
        
        _FaBiaoDT.sd_layout
        .topSpaceToView(self.touXiang,10)
        .leftSpaceToView(self.contentView,10)
        .rightSpaceToView(self.contentView,10)
        .autoHeightRatio(0);
        
        _neiRong.sd_layout
        .topSpaceToView(self.FaBiaoDT,3)
        .leftSpaceToView(self.contentView,10)
        .rightSpaceToView(self.contentView,10)
        .heightIs(400);
        
        _dianZan.sd_layout
        .topSpaceToView(self.neiRong,20)
        .leftEqualToView(self.neiRong)
        .widthIs(30)
        .heightIs(30);
        
        
        _dianZanShu.sd_layout
        .topSpaceToView(self.neiRong,30)
        .leftSpaceToView(self.dianZan,4)
        .widthIs(50)
        .autoHeightRatio(0);
        
        _juZan.sd_layout
        .topSpaceToView(self.neiRong,20)
        .leftSpaceToView(self.dianZanShu,10)
        .widthIs(30)
        .heightIs(30);
        
        
        _juZanShu.sd_layout
        .topSpaceToView(self.neiRong,30)
        .leftSpaceToView(self.juZan,4)
        .widthIs(50)
        .autoHeightRatio(0);
        
        
        _pingLuo.sd_layout
        .topSpaceToView(self.neiRong,20)
        .leftSpaceToView(self.juZanShu,10)
        .widthIs(30)
        .heightIs(30);
        
        
        _pingLuoShu.sd_layout
        .topSpaceToView(self.neiRong,30)
        .leftSpaceToView(self.pingLuo,4)
        .widthIs(50)
        .autoHeightRatio(0);
        
        _zhuanFaShu.sd_layout
        .topSpaceToView(self.neiRong,30)
        .rightSpaceToView(self.contentView,10)
        .widthIs(80)
        .autoHeightRatio(0);
        
        _zhuanFa.sd_layout
        .topSpaceToView(self.neiRong,20)
        .leftSpaceToView(self.pingLuoShu,10)
        .widthIs(30)
        .heightIs(30);

        
        [self setupAutoHeightWithBottomViewsArray:@[_dianZan,_dianZanShu,_juZan,_juZanShu,_pingLuo,_pingLuoShu,_zhuanFa,_pingLuoShu] bottomMargin:10];
        
    }
    return self;
}
-(void)setModel:(RebaOneData *)model{
    
    [self.touXiang sd_setImageWithURL:[NSURL URLWithString:model.touXiang] placeholderImage:[UIImage imageNamed:@""]];
    
    self.name.text = model.name;
    self.FaBiaoDT.text = model.FaBiaoDT;
    [self.neiRong sd_setImageWithURL:[NSURL URLWithString:model.neiRongTP] placeholderImage:[UIImage imageNamed:@""]];
    
    
    self.dianZanShu.text = [NSString stringWithFormat:@"%@",model.dianZanShu];
    self.juZanShu.text = [NSString stringWithFormat:@"%@",model.juZanShu];
    self.pingLuoShu.text = [NSString stringWithFormat:@"%@",model.pingLuoShu];
    self.zhuanFaShu.text = [NSString stringWithFormat:@"%@",model.zhuanFaShu];
    
}

@end
