  //
//  Jinhua.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Jinhua.h"
#import "zhiBoData.h"
#import "zhiBoTableViewCell.h"

#import <AFNetworking.h>
#import <MJRefresh.h>


#define URL @"http://live.9158.com/Fans/GetHotLive?page=1"

@interface Jinhua ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic, strong)NSMutableArray*arrData;

@end

@implementation Jinhua

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self TableView];
    [self UrlData];
    
    
}

-(void)TableView{
    
    _tableView=[[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
}


-(void)UrlData{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    [manager GET: URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _arrData=[[NSMutableArray alloc] init];
        NSDictionary*data=responseObject[@"data"];
        
        NSLog(@"---%@",responseObject[@"msg"]);
        NSArray*array1=data[@"list"];
        for (NSDictionary*dic in array1) {
            
            zhiBoData*model=[[zhiBoData alloc] init];
            
            model.smallpic=dic[@"smallpic"];
            model.myname=dic[@"myname"];
            model.gps=dic[@"gps"];
            model.flv=dic[@"flv"];
            
            NSLog(@"________________%@",model.flv);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败");
    }];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 500;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrData.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*str=@"biao";
    zhiBoTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[zhiBoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.model=_arrData[indexPath.row];
    
    return cell;
    
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
