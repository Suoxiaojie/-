//
//  My.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/14.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "My.h"

@interface My ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*table;


@end

@implementation My

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //导航条左按钮  导航条右按钮

    UIBarButtonItem*LeftButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Shouyeleft"] style:UIBarButtonItemStylePlain target:self action:@selector(touxiang)];
    self.navigationItem.leftBarButtonItem=LeftButton;
    
    UIBarButtonItem*RightBotton=[[UIBarButtonItem alloc]initWithTitle:@"黑名单" style:UIBarButtonItemStylePlain target:self action:@selector(Heimingdan)];
    self.navigationItem.rightBarButtonItem=RightBotton;
    
}
-(void)touxiang{
    
    
}

-(void)Heimingdan{
    
    
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
