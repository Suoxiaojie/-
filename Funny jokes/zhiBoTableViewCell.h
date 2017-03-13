//
//  zhiBoTableViewCell.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/3/3.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhiBoData.h"

@interface zhiBoTableViewCell : UITableViewCell


@property(nonatomic, strong)UIImageView * touXiang;//头像

@property(nonatomic, strong)UILabel * name;//名字

@property(nonatomic, strong)UILabel *dingWei;//定位

@property(nonatomic, strong)UIImageView * zhiBo;//直播内容


@property(nonatomic, strong)zhiBoData*model;



@end
