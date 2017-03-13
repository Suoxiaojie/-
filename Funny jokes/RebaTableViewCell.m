//
//  RebaTableViewCell.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/23.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "RebaTableViewCell.h"

#import <SDAutoLayout.h>
#import <SDWebImage/UIImageView+WebCache.h>
#define kHEIGHT 250

@implementation RebaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _touXiang=[[UIImageView alloc] init];
        _touXiang.layer.cornerRadius=5;
        _touXiang.layer.masksToBounds=YES;
        [self.contentView addSubview:self.touXiang];
        
        
        _huaTi=[[UILabel alloc] init];
        _huaTi.font=[UIFont systemFontOfSize:18];
        _huaTi.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.huaTi];
        
        _huaTiNeiRong=[[UILabel alloc] init];
        _huaTiNeiRong.font=[UIFont systemFontOfSize:14];
        _huaTiNeiRong.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.huaTiNeiRong];
        
        
        //按钮
        _button=[[UIButton alloc] init];
        _button.layer.borderWidth=2;
        _button.layer.cornerRadius=5;
        [_button setTitle:@"订阅" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _button.titleLabel.font=[UIFont systemFontOfSize:17];
        [_button addTarget:self action:@selector(dingYue) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.button];
        
        
        _dingYue=[[UILabel alloc] init];
        _dingYue.font=[UIFont systemFontOfSize:14];
        _dingYue.textColor=[UIColor blackColor];
        _dingYue.text=@"订阅";
        [self.contentView addSubview:self.dingYue];
        
        _dingYueShu=[[UILabel alloc] init];
        _dingYueShu.font=[UIFont systemFontOfSize:14];
        _dingYueShu.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.dingYueShu];
        
        
        _zongTie=[[UILabel alloc] init];
        _zongTie.font=[UIFont systemFontOfSize:14];
        _zongTie.textColor=[UIColor blackColor];
        _zongTie.text=@"总帖数";
        [self.contentView addSubview:self.zongTie];
        
        
        _zongTieShu=[[UILabel alloc] init];
        _zongTieShu.font=[UIFont systemFontOfSize:14];
        _zongTieShu.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.zongTieShu];
        
        
        
        
        _button.sd_layout
        .topSpaceToView(self.contentView,34)
        //.leftSpaceToView(self.huaTiNeiRong,2)
        .rightSpaceToView(self.contentView,2)
        .widthIs(60)
        .heightIs(30);
        
        
        
        _touXiang.sd_layout
        .topSpaceToView(self.contentView,8)
        .leftSpaceToView(self.contentView,5)
        .widthIs(80)
        .heightIs(80);
        
        _huaTi.sd_layout
        .topSpaceToView(self.contentView,5)
        .leftSpaceToView(self.touXiang,10)
        .widthIs(150)
        .autoHeightRatio(0);
        
        _huaTiNeiRong.sd_layout
        .topSpaceToView(self.huaTi,5)
        .leftSpaceToView(self.touXiang,10)
        //.rightSpaceToView(self.button,1)
        .widthIs(250);
        //.autoHeightRatio(0);
        
        _dingYueShu.sd_layout
        .topSpaceToView(self.huaTiNeiRong,7)
        .leftSpaceToView(self.touXiang,10)
        .widthIs(60)
        .autoHeightRatio(0);
        
        _dingYue.sd_layout
        .topSpaceToView(self.huaTiNeiRong,7)
        .leftSpaceToView(self.dingYueShu,3)
        .widthIs(60)
        .autoHeightRatio(0);
        
        _zongTie.sd_layout
        .topSpaceToView(self.huaTiNeiRong,7)
        .leftSpaceToView(self.dingYue,8)
        .widthIs(60)
        .autoHeightRatio(0);
        
        _zongTieShu.sd_layout
        .topSpaceToView(self.huaTiNeiRong,7)
        .leftSpaceToView(self.zongTie,3)
        .widthIs(60)
        .autoHeightRatio(0);
        
        
        [self setupAutoHeightWithBottomViewsArray:@[_dingYueShu,_dingYue,_zongTie,_zongTieShu] bottomMargin:10];
        
        
        

        
    
    }
    
    return self;
}




-(void)setModel:(RebaData *)model{
    
    [self.touXiang sd_setImageWithURL:[NSURL URLWithString:model.touXiang] placeholderImage:[UIImage imageNamed:@""]];
    
    
    self.huaTi.text=model.huaTi;
    self.huaTiNeiRong.text=model.huaTiNeiRong;
    
    self.dingYueShu.text=[NSString stringWithFormat:@"%@",model.dingYueShu];
    self.zongTieShu.text=[NSString stringWithFormat:@"%@",model.zongTieShu];
}






@end
