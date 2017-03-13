//
//  Tuijian.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Tuijian.h"
#import "TuijianData.h"
#import "TuijianTableViewCell.h"
#import <AFNetworking.h>
#import <SDAutoLayout.h>
#import <YYModel.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

//下拉刷新
#import <MJRefresh.h>

@interface Tuijian ()<UITableViewDelegate,UITableViewDataSource>
    
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,copy)NSMutableArray*arrData;

#define URL @"http://lf.snssdk.com/neihan/stream/mix/v1/?content_type=-101&iid=7831664713&os_version=10.2.1&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=A8B345AC-7EBC-4464-B2C0-EC889FD37D8F&live_sdk_version=130&vid=3B2D8102-C5C6-4E4E-88DF-42258735B785&openudid=3ae393518bfd684561672e585ba5c7cfb238b9ab&device_type=iPhone9,1&version_code=6.0.0&ac=WIFI&screen_width=750&device_id=35025040258&aid=7&content_type=-101&count=30&double_col_mode=0&essence=1&message_cursor=0&min_time=1487655472&mpic=1"

@end

@implementation Tuijian

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor redColor];
    [self getTable];
    
    
    
    
    UIButton*but=[[UIButton alloc]initWithFrame:CGRectMake(370, 540, 40, 40)];
    [but setBackgroundImage:[UIImage imageNamed:@"Shouye"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(shuaXing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    [self getUrl];
}

-(void)shuaXing{
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getUrl)];
    
    // Enter the refresh status immediately
    [self.tableView.mj_header beginRefreshing];
    
    
    
}



-(void)getTable{
    
    
        
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getUrl)];
    
    // Enter the refresh status immediately
    [self.tableView.mj_header beginRefreshing];
    
    
    
    
}


-(void)getUrl{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    [manager GET: URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _arrData=[[NSMutableArray alloc]init];
        
        TuijianData *model = [[TuijianData alloc] init];
        [model setValuesForKeysWithDictionary:(NSDictionary *)responseObject];
        
        TuijianData_data *model_data = [[TuijianData_data alloc] init];
        [model_data setValuesForKeysWithDictionary:model.data];
        
        for (NSDictionary *dic in model_data.data) {
            TuijianData_data_data *model_data2 = [[TuijianData_data_data alloc] init];
            [model_data2 setValuesForKeysWithDictionary:dic];
            
            if (model_data2.type == 1) {
                TuijianData_data_data_group *model_group = [[TuijianData_data_data_group alloc] init];
                [model_group setValuesForKeysWithDictionary:model_data2.group];
                [model_group setValuesForKeysWithDictionary:model_group.user];
                
                for (NSDictionary *dic2 in model_group.large_cover[@"url_list"]) {
                    [model_group setValuesForKeysWithDictionary:dic2];
                }
                for (NSDictionary *dic3 in model_group.large_image[@"url_list"]) {
                    [model_group setValuesForKeysWithDictionary:dic3];
                }
                [_arrData addObject:model_group];
            }
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrData.count;
}

//自动适配

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TuijianData_data_data_group *model=_arrData[indexPath.row];
    
    
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[TuijianTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    static NSString*str=@"biao";
    
    TuijianTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[TuijianTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model=_arrData[indexPath.row];
    
    
    return cell;

}

//表格点击方法

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TuijianData_data_data_group * data= _arrData[indexPath.row];
    NSLog(@"url:%@  mp4:%@",data.url,data.mp4_url);
    
    if (data.url&&data.mp4_url) {
        
        NSString * url = [NSString stringWithFormat:@"%@",data.mp4_url];
        NSURL * video =[NSURL URLWithString:url];
        
        AVPlayerViewController * avp=[[AVPlayerViewController alloc] init];
        avp.player=[[AVPlayer alloc] initWithURL:video];
        avp.videoGravity=AVLayerVideoGravityResizeAspect;
        
        [self presentViewController:avp animated:YES completion:^{
            
        }];

        
        
        
        
    } else if(data.mp4_url==nil){
        
        TuijianData_data_data_group * data= _arrData[indexPath.row];
        UIImageView*view=[[UIImageView alloc] initWithFrame:self.view.frame];
        [view setImage:[UIImage imageNamed:data.url]];
        
        [self.view addSubview:view];
        
}
    
    
}
-(void)boFang{
    
    


    
    

    
    
    
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
