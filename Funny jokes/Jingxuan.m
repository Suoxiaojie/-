//
//  Jingxuan.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Jingxuan.h"

#import "Tupian.h"
#import "Shiping.h"
#import "Duanyouxiu.h"
#import "Tuijian.h"
#import "Duanzi.h"
#import "Jinhua.h"


@interface Jingxuan ()

@end

@implementation Jingxuan

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //滚动条
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [self setTabBarFrame:CGRectMake(0, 0, screenSize.width, 44)
        contentViewFrame:CGRectMake(0, 40, screenSize.width, screenSize.height - 44 - 20)];
    
    self.tabBar.itemTitleColor = [UIColor lightGrayColor];
    self.tabBar.itemTitleSelectedColor = [UIColor redColor];
    self.tabBar.itemTitleFont = [UIFont systemFontOfSize:17];
    self.tabBar.itemTitleSelectedFont = [UIFont systemFontOfSize:22];
    self.tabBar.leftAndRightSpacing = 20;
    
    self.tabBar.itemFontChangeFollowContentScroll = YES;
    self.tabBar.itemSelectedBgScrollFollowContent = YES;
    self.tabBar.itemSelectedBgColor = [UIColor redColor];
    
    [self.tabBar setItemSelectedBgInsets:UIEdgeInsetsMake(40, 15, 0, 15) tapSwitchAnimated:NO];
    [self.tabBar setScrollEnabledAndItemFitTextWidthWithSpacing:40];
    
    [self setContentScrollEnabledAndTapSwitchAnimated:NO];
    self.loadViewOfChildContollerWhileAppear = YES;
    
    [self initViewControllers];
    
   
    

}


//滚动视图
-(void)initViewControllers{
    
    Tuijian*tuijian=[[Tuijian alloc]init];
    tuijian.yp_tabItemTitle=@"推荐";
    
    Shiping*shiping=[[Shiping alloc]init];
    shiping.yp_tabItemTitle=@"视频";
    
    Duanyouxiu*duanyou=[[Duanyouxiu alloc]init];
    duanyou.yp_tabItemTitle=@"段友秀";
    
    Tupian*tupian=[[Tupian alloc]init];
    tupian.yp_tabItemTitle=@"图片";
    
    Duanzi*duanzi=[[Duanzi alloc]init];
    duanzi.yp_tabItemTitle=@"段子";
    
    Jinhua*jinhua=[[Jinhua alloc]init];
    jinhua.yp_tabItemTitle=@"直播";
    

    
    
    self.viewControllers = [NSMutableArray arrayWithObjects:tuijian, shiping, duanyou, tupian,duanzi,jinhua, nil];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
