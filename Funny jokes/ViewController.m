//
//  ViewController.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/14.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "ViewController.h"
#import "Shouye.h"
#import "Faxian.h"
#import "Xinxiang.h"
#import "My.h"

#import "Tupian.h"
#import "Shiping.h"
#import "Duanyouxiu.h"
#import "Tuijian.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Shouye*shouye=[[Shouye alloc]init];
    shouye.tabBarItem.image=[[UIImage imageNamed:@"首页"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shouye.title=@"首页";
    
    Faxian*faxian=[[Faxian alloc]init];
    faxian.tabBarItem.image=[[UIImage imageNamed:@"发现"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    faxian.title=@"发现";
    
    Xinxiang*xinxiang=[[Xinxiang alloc]init];
    xinxiang.tabBarItem.image=[[UIImage imageNamed:@"新鲜"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    xinxiang.title=@"新鲜";
    
    My*my=[[My alloc]init];
    my.tabBarItem.image=[[UIImage imageNamed:@"我的"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    my.title=@"我的";
    
    UINavigationController*nav1=[[UINavigationController alloc]initWithRootViewController:shouye];
    UINavigationController*nav2=[[UINavigationController alloc]initWithRootViewController:faxian];
    UINavigationController*nav3=[[UINavigationController alloc]initWithRootViewController:xinxiang];
    UINavigationController*nav4=[[UINavigationController alloc]initWithRootViewController:my];

    
    
    
    self.viewControllers=@[nav1,nav2,nav3,nav4];
    
    self.tabBar.tintColor=[UIColor colorWithRed:(235/255.0) green:(22/255.0) blue:(37/255.0) alpha:1];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
