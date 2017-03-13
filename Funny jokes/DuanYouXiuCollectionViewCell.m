//
//  DuanYouXiuCollectionViewCell.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/24.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "DuanYouXiuCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@implementation DuanYouXiuCollectionViewCell

-(void)setModel:(DuanYouXiuData *)model{
    _model=model;
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:_model.shiPingZP] placeholderImage:[UIImage imageNamed:@""]];
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:_model.touXiang] placeholderImage:[UIImage imageNamed:@""]];
    [self.likeButton setTitle:[NSString stringWithFormat:@"%@",_model.dianZanShuL] forState:UIControlStateNormal];
    
    
   
    
    self.nickName.text=_model.name;
    
    
}


@end
