//
//  Tupian.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Tupian.h"
#import "TupianData.h"
#import "TupianTableViewCell.h"


#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYModel.h>
#import <SDAutoLayout.h>

//下拉刷新
#import <MJRefresh.h>

#define URL @"http://lf.snssdk.com/neihan/stream/mix/v1/?content_type=-103&iid=7831664713&os_version=10.1.1&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=A8B345AC-7EBC-4464-B2C0-EC889FD37D8F&live_sdk_version=130&vid=3B2D8102-C5C6-4E4E-88DF-42258735B785&openudid=3ae393518bfd684561672e585ba5c7cfb238b9ab&device_type=iPhone9,1&version_code=6.0.0&ac=WIFI&screen_width=750&device_id=35025040258&aid=7&content_type=-103&count=30&double_col_mode=0&essence=1&message_cursor=0&min_time=1487315726&mpic=1"

@interface Tupian ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic, copy) NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView*table;

@end

@implementation Tupian

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getTable];
    
    [self getUrlData];
    
    //刷新按钮
    UIButton*but=[[UIButton alloc]initWithFrame:CGRectMake(370, 540, 40, 40)];
    [but setBackgroundImage:[UIImage imageNamed:@"Shouye"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(shuaXing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
}

-(void)shuaXing{
    
    
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getUrlData)];
    
    // Enter the refresh status immediately
    [self.table.mj_header beginRefreshing];
    
    
    
}
-(void)getTable{
    CGRect frame = self.view.frame;
    self.table=[[UITableView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    
    self.table.dataSource=self;
    self.table.delegate=self;
    [self.view addSubview:self.table];
    
    
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getUrlData)];
    
    // Enter the refresh status immediately
    [self.table.mj_header beginRefreshing];
    
    
}
-(void)getUrlData{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
  
    [manager GET: URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _dataArr=[[NSMutableArray alloc]init];
        
        NSDictionary*data=responseObject[@"data"];
        NSArray*array1=data[@"data"];
        
        for (NSDictionary*dic in array1) {
            
            NSDictionary*group=dic[@"group"];
            
            NSDictionary*user=group[@"user"];
            TupianData*model=[[TupianData alloc]init];
            model.avatar_url=user[@"avatar_url"];
            model.name=user[@"name"];
            
            model.text=group[@"text"];
            NSDictionary*large_image=group[@"large_image"];
            
            NSArray*url_list=large_image[@"url_list"];
            
            for (NSDictionary*dic2 in url_list) {
                
                NSString*url_list=dic2[@"url"];
                model.url=url_list;
            }
            model.digg_count=group[@"digg_count"];
            model.bury_count=group[@"bury_count"];
            model.comment_count=group[@"comment_count"];
            model.share_count=group[@"share_count"];
            
            
            [_dataArr addObject:model];
            [self.table reloadData];
            [self.table.mj_header endRefreshing];
        }
        
        

        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    


    
    
}


//表格

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TupianData *model = _dataArr[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[TupianTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*str=@"Cell";
    TupianTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[TupianTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.model = _dataArr[indexPath.row];
    
    
    //去除点击效果
    cell.selectionStyle=UITableViewCellAccessoryNone;
    
    return cell;
    
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
