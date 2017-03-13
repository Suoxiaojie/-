//
//  Hot.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Hot.h"
#import "RebaTableViewCell.h"
#import "RebaData.h"
#import "HotOneViewController.h"


#import <AFNetworking.h>
#import <SDAutoLayout.h>
#import <YYModel.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define kHEIGHT 200

#define URL @"http://lf.snssdk.com/2/essay/discovery/v3/?iid=7831664713&os_version=10.2.1&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=A8B345AC-7EBC-4464-B2C0-EC889FD37D8F&live_sdk_version=130&vid=3B2D8102-C5C6-4E4E-88DF-42258735B785&openudid=3ae393518bfd684561672e585ba5c7cfb238b9ab&device_type=iPhone9,1&version_code=6.0.0&ac=WIFI&screen_width=750&device_id=35025040258&aid=7"

@interface Hot ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,copy)NSMutableArray*arrData;
@property(nonatomic, copy) NSMutableArray *arrData2;

@end

@implementation Hot

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    
    [self getUrl];
    [self getTable];
    
    
    
    
}

-(void)getTable{
    _tableView=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];

    
}

- (void)setUpXiaLa {
    
    self.tableView.contentInset = UIEdgeInsetsMake(kHEIGHT, 0, 0, 0);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kHEIGHT, [UIScreen mainScreen].bounds.size.width, kHEIGHT)];
    RebaData_xiala *xiala = _arrData2[0];
    [imageView sd_setImageWithURL:[NSURL URLWithString:xiala.xiaLaFD]];
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.tag = 101;
    
    [self.tableView addSubview:imageView];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    if (point.y < -kHEIGHT) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.size.height = - point.y ;
        rect.origin.y = point.y;
        [self.tableView viewWithTag:101].frame = rect;
    }
}
-(void)getUrl{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    [manager GET: URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*data=responseObject[@"data"];
        NSDictionary*categories=data[@"categories"];
        
        _arrData=[[NSMutableArray alloc]init];
        _arrData2 = [[NSMutableArray alloc] init];
        
        NSArray*array1=categories[@"category_list"];
        for (NSDictionary*dic in array1) {
            
            RebaData*model=[[RebaData alloc]init];
            
            model.huaTiNeiRong=dic[@"intro"];
            model.touXiang=dic[@"icon_url"];
            model.zongTieShu=dic[@"total_updates"];
            model.dingYueShu=dic[@"subscribe_count"];
            model.iid = [dic[@"iid"] integerValue];
            [model setValuesForKeysWithDictionary:dic];
            
            model.huaTi=dic[@"name"];
            //NSLog(@"-------++++++++%@",model.huaTi);
            
            [_arrData addObject:model];
            
        }
        NSDictionary*rotate_banner=data[@"rotate_banner"];
        NSArray*array2=rotate_banner[@"banners"];
        for (NSDictionary*dic2 in array2) {
            RebaData_xiala *model=[[RebaData_xiala alloc]init];
            NSDictionary*banner_url=dic2[@"banner_url"];
            NSArray*array3=banner_url[@"url_list"];
            for (NSDictionary*dic3 in array3) {
                model.xiaLaFD=dic3[@"url"];
                [_arrData2 addObject:model];
                
            }
            [self setUpXiaLa];
        }
        
        
        [self.tableView reloadData];

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrData.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*str=@"biao";
    RebaTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell= [[RebaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.model=_arrData[indexPath.row];

    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RebaData*model=_arrData[indexPath.row];
    
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[RebaTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HotOneViewController*one=[[HotOneViewController alloc]init];
    one.model = _arrData[indexPath.row];
    [self.navigationController pushViewController:one animated:NO];
    
    
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
