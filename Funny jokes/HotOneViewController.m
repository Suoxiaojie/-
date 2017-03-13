//
//  HotOneViewController.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/24.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "HotOneViewController.h"
#import "RebaData.h"
#import "RebaOneData.h"
#import "RebaOneTableViewCell.h"

#import <AFNetworking.h>
#import <SDAutoLayout.h>
#import <YYModel.h>
#import <SDWebImage/UIImageView+WebCache.h>


#define URL @"http://lf.snssdk.com/neihan/stream/category/data/v2/?tag=joke&iid=7831664713&os_version=10.2.1&os_api=18&app_name=joke_essay&channel=App20Store&device_platform=iphone&idfa=A8B345AC-7EBC-4464-B2C0-EC889FD37D8F&live_sdk_version=130&vid=3B2D8102-C5C6-4E4E-88DF-42258735B785&openudid=3ae393518bfd684561672e585ba5c7cfb238b9ab&device_type=iPhone9,1&version_code=6.0.0&ac=WIFI&screen_width=750&device_id=35025040258&aid=7&category_id=%ld&count=30&level=6&message_cursor=0&min_time=1488271679&mpic=1"






@interface HotOneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView*tableView;
@property(nonatomic, strong) NSMutableArray*arrData;

@end

@implementation HotOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=self.model.huaTi;
    
    [self getTable];
    
    [self getUrl];
    
    
    
}
-(void)getTable{
    
    _tableView=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:self.tableView];
    
}

-(void)getUrl{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    NSString *urlString = [NSString stringWithFormat:URL,self.model.iid];
    //NSLog(@"\n%@",urlString);
    [manager GET: urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _arrData=[[NSMutableArray alloc] init];
        
        NSDictionary*data=responseObject[@"data"];
        NSArray*array=data[@"data"];
        
        for (NSDictionary*dic in array) {
            
            RebaOneData*model=[[RebaOneData alloc] init];
//            model.type1=[dic[@"type1"] integerValue];
//            NSLog(@"_______-----%ld",model.type1);
            NSDictionary*group=dic[@"group"];
            
            NSDictionary*user=group[@"user"];
            model.name=user[@"name"];
            model.touXiang=user[@"avatar_url"];
            
            
            model.FaBiaoDT=group[@"text"];
            model.dianZanShu=group[@"comment_count"];
            model.zhuanFaShu=group[@"share_count"];
            model.juZanShu=group[@"bury_count"];
            model.pingLuoShu=group[@"digg_count"];
            
            NSDictionary*middle_image=group[@"middle_image"];
            NSArray*array1=middle_image[@"url_list"];
            for (NSDictionary*dic2 in array1) {
                model.neiRongTP=dic2[@"url"];
            }
            [_arrData addObject:model];
            [self.tableView reloadData];
           }
        
        

        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrData.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*str=@"biao";
    RebaOneTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[RebaOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.model=_arrData[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RebaData*model=_arrData[indexPath.row];
    
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[RebaOneTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
    
    //return 500;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
