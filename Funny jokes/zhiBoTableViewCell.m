//
//  zhiBoTableViewCell.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/3/3.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "zhiBoTableViewCell.h"
#import <SDAutoLayout.h>
#import <SDWebImage/UIImageView+WebCache.h>


@implementation zhiBoTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _touXiang=[[UIImageView alloc] init];
        _touXiang.layer.cornerRadius=20;
        _touXiang.layer.masksToBounds=YES;
        [self.contentView addSubview:self.touXiang];//头像
        
        _name=[[UILabel alloc] init];
        _name.font=[UIFont systemFontOfSize:16];
        _name.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.name];
        
        _dingWei=[[UILabel alloc] init];
        _dingWei.font=[UIFont systemFontOfSize:16];
        _dingWei.textColor=[UIColor blackColor];
        [self.contentView addSubview:self.dingWei];
        
        _zhiBo=[[UIImageView alloc] init];
        [self.contentView addSubview:self.zhiBo];
        
        
        
        _touXiang.sd_layout
        .topSpaceToView(self.contentView,2)
        .leftSpaceToView(self.contentView,2)
        .widthIs(40)
        .heightIs(40);
        
        _name.sd_layout
        .topSpaceToView(self.contentView,6)
        .leftSpaceToView(self.touXiang,10)
        //.widthIs(200)
        .autoHeightRatio(0);
        
        _dingWei.sd_layout
        .topSpaceToView(self.name,5)
        .leftSpaceToView(self.touXiang,10)
        .autoHeightRatio(0);
        
        _zhiBo.sd_layout
        .topSpaceToView(self.touXiang,2)
        .leftSpaceToView(self.contentView,0)
        .rightSpaceToView(self.contentView,0)
        .heightIs(500);
        
        
        
    }
    
    return self;
}

@end
