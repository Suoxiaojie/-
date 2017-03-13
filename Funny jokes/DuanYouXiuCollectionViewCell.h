//
//  DuanYouXiuCollectionViewCell.h
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/24.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DuanYouXiuData.h"

@interface DuanYouXiuCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;




@property(nonatomic,strong)DuanYouXiuData*model;



@end
