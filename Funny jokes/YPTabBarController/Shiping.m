//
//  Shiping.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Shiping.h"
#import <YYModel.h>
#import "ShipingTableViewCell.h"
#import "ShipingData.h"
#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "SelectedCellViewController.h"
#import <SDAutoLayout.h>

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
//下拉刷新
#import <MJRefresh.h>




#define URL @"http://lg.snssdk.com/neihan/stream/mix/v1/?content_type=-104&iid=7831664713&os_version=10.1.1&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=A8B345AC-7EBC-4464-B2C0-EC889FD37D8F&live_sdk_version=130&vid=3B2D8102-C5C6-4E4E-88DF-42258735B785&openudid=3ae393518bfd684561672e585ba5c7cfb238b9ab&device_type=iPhone9,1&version_code=6.0.0&ac=WIFI&screen_width=750&device_id=35025040258&aid=7&content_type=-104&count=30&double_col_mode=0&essence=1&message_cursor=0&min_time=1487225407&mpic=1"

@interface Shiping ()<UITableViewDelegate,UITableViewDataSource>

{
    NSString *urlString;
    AVPlayerViewController*avplayer;
}

@property(nonatomic, copy) NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView*table;


@end

@implementation Shiping

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getTable];
    
    // 请求数据
    [self getUrlData];
    
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
    self.table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    _dataArr=[[NSMutableArray alloc]init];
    ShipingData*model=[[ShipingData alloc] init];
    [model setValuesForKeysWithDictionary:(NSDictionary*)responseObject];
    
    ShipingData_data*model_data=[[ShipingData_data alloc] init];
    [model_data setValuesForKeysWithDictionary:model.data];
    
    for (NSDictionary*dic in model_data.data) {
        
        ShipingData_data_data*model_data_data=[[ShipingData_data_data alloc] init];
        [model_data_data setValuesForKeysWithDictionary:dic];
        
        if (model_data_data.type == 1) {
            ShipingData_data_data_group*model_group=[[ShipingData_data_data_group alloc] init];
            [model_group setValuesForKeysWithDictionary:model_data_data.group];
            [model_group setValuesForKeysWithDictionary:model_group.user];
            for (NSDictionary*dic2 in model_group.large_cover[@"url_list"]) {
                [model_group setValuesForKeysWithDictionary:dic2];
                
                //NSLog(@"-----%@",model_group.name);
                
            }
            [_dataArr addObject:model_group];

            
        }
    }

    
        
    
        [self.table reloadData];
        
        [self.table.mj_header endRefreshing];
    }
    

    
        
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        
        NSLog(@"%@",error);
        
    }];
    

    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShipingData*model=_dataArr[indexPath.row];
    
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ShipingTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*str=@"Cell";
    ShipingTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[ShipingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    //ShipingData *model = _dataArr[indexPath.row];
    cell.model=_dataArr[indexPath.row];
    
    //去除点击效果
    cell.selectionStyle=UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ShipingData_data_data_group *data = _dataArr[indexPath.row];

    NSString *url = [NSString stringWithFormat:@"%@",data.mp4_url];
    
    

    
    NSURL *videoUrl = [NSURL URLWithString:url];
    AVPlayerViewController *avPlayer = [[AVPlayerViewController alloc] init];
    avPlayer.player = [[AVPlayer alloc] initWithURL:videoUrl];
    avPlayer.videoGravity = AVLayerVideoGravityResizeAspect;
   
    [self presentViewController:avPlayer animated:YES completion:^{
         [avPlayer player];
    }];
    
    
    
    
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
