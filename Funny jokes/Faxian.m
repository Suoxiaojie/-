//
//  Faxian.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/14.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Faxian.h"
#import "Hot.h"
#import "Dingyue.h"

@interface Faxian ()<UIScrollViewDelegate>
@property(nonatomic,strong)UISegmentedControl*segmentedControl;
@property(nonatomic,strong)UIScrollView*scrollView;
@property(nonatomic,strong)Hot*firstVC;
@property (nonatomic, strong)Dingyue *secondTVC;

@end

@implementation Faxian

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //导航条左按钮   右按钮
    
    UIBarButtonItem * left=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"搜索"] style:UIBarButtonItemStylePlain target:self action:@selector(SouSuo)];
    self.navigationItem.leftBarButtonItem=left;
    
    UIBarButtonItem * right=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Faxianright"] style:UIBarButtonItemStylePlain target:self action:@selector(DingWei)];
    self.navigationItem.rightBarButtonItem=right;
    
    
    
    //分段控制器
    [self getFD];
}
//搜索
-(void)SouSuo{
    
}
//定位
-(void)DingWei{
    
    
}

-(void)getFD{
    
    // 适应scrollView
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"热吧", @"订阅"]];
    self.navigationItem.titleView = self.segmentedControl;
    
    [self.segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 0;
    
    
    // 创建scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    [self.view addSubview:self.scrollView];
    // 设置scrollView的内容
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height - 64);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    
    // 创建控制器
    self.firstVC= [Hot new];
    self.secondTVC = [[Dingyue alloc] initWithStyle:UITableViewStylePlain];
    // 添加为self的子控制器
    [self addChildViewController:self.firstVC];
    [self addChildViewController:self.secondTVC];
    self.firstVC.view.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, CGRectGetHeight(self.scrollView.frame));
    self.secondTVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, self.scrollView.frame.size.width, CGRectGetHeight(self.scrollView.frame));
    [self.scrollView addSubview:self.firstVC.view];
    [self.scrollView addSubview:self.secondTVC.view];
    
    // 设置scrollView的代理
    self.scrollView.delegate = self;
    
    
}
- (void)segmentedControlAction:(UISegmentedControl *)sender
{
    [self.scrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex * self.scrollView.frame.size.width, 0) animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger n = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.segmentedControl.selectedSegmentIndex = n;
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
