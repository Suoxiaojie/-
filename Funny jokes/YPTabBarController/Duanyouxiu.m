//
//  Duanyouxiu.m
//  Funny jokes
//
//  Created by 💋索少杰 on 2017/2/15.
//  Copyright © 2017年 💋索少杰. All rights reserved.
//

#import "Duanyouxiu.h"
#import "DuanYouXiuData.h"
#import "DuanYouXiuCollectionViewCell.h"
#import "XRWaterfallLayout.h"

#import <MJRefresh.h>

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import <AFNetworking.h>


#define URL @"http://lf.snssdk.com/neihan/stream/mix/v1/?content_type=-301&iid=7831664713&os_version=10.2.1&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=A8B345AC-7EBC-4464-B2C0-EC889FD37D8F&live_sdk_version=130&vid=3B2D8102-C5C6-4E4E-88DF-42258735B785&openudid=3ae393518bfd684561672e585ba5c7cfb238b9ab&device_type=iPhone9,1&version_code=6.0.0&ac=WIFI&screen_width=750&device_id=35025040258&aid=7&content_type=-301&count=30&double_col_mode=1&essence=1&message_cursor=0&min_time=1487656021&mpic=1"



@interface Duanyouxiu ()<UICollectionViewDataSource,XRWaterfallLayoutDelegate,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collect;
@property(nonatomic,strong)NSMutableArray*arrData;

@end

@implementation Duanyouxiu



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 创建流布局
    XRWaterfallLayout *flowlay = [XRWaterfallLayout waterFallLayoutWithColumnCount:2];
    // 设置间距
    [flowlay setColumnSpacing:8 rowSpacing:8 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    // 设置代理
    flowlay.delegate= self;
    // 创建网格对象
    _collect = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowlay];
    // 设置背景
    _collect.backgroundColor = [UIColor whiteColor];
    // 注册网格单元格
    [_collect registerNib:[UINib nibWithNibName:NSStringFromClass([DuanYouXiuCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([DuanYouXiuCollectionViewCell class])];
    _collect.delegate=self;
    _collect.dataSource = self;
    // 添加到视图
    [self.view addSubview:self.collect];
    
    

    //上拉刷新
    self.collect.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        
        
    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    self.collect.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(shangla)];
    
    // Enter the refresh status immediately
    [self.collect.mj_footer beginRefreshing];
    
    
    
    
    //下拉刷新
    UIButton*but=[[UIButton alloc]initWithFrame:CGRectMake(370, 540, 40, 40)];
    [but setBackgroundImage:[UIImage imageNamed:@"Shouye"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(shuaXing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    _arrData=[[NSMutableArray alloc]init];
    [self getUrl];
    
}
-(void)shuaXing{
    self.collect.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        
    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadNewData]）
    self.collect.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(xiala)];
    
    // Enter the refresh status immediately
    [self.collect.mj_header beginRefreshing];
    
}
// 布局的代理实现
- (CGFloat)waterfallLayout:(XRWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    
    DuanYouXiuData *mm = self.arrData[indexPath.item];
    
    CGFloat spHeight = [mm.shiPingHeight floatValue];
    CGFloat spWidth = [mm.shiPingWidth floatValue];
    
    return spHeight /spWidth * itemWidth;
}
// 网格代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrData.count;
//    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     DuanYouXiuCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DuanYouXiuCollectionViewCell class])forIndexPath:indexPath];
    cell.model = self.arrData[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


- (void)xiala {
    
    _arrData=[[NSMutableArray alloc]init];
    [self getUrl];
}

- (void)shangla {
    [self getUrl];
}

-(void)getUrl{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    [manager GET: URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*data=responseObject[@"data"];
        NSArray*array=data[@"data"];
        for (NSDictionary*dic in array) {
            DuanYouXiuData*model=[[DuanYouXiuData alloc] init];
            NSDictionary*group=dic[@"group"];
            model.dianZanShuL=group[@"digg_count"];
            
            NSDictionary*p_video=group[@"360p_video"];
            model.shiPingWidth=p_video[@"width"];
            model.shiPingHeight=p_video[@"height"];
            
            
            
            NSArray*array2=p_video[@"url_list"];
            for (NSDictionary*dic2 in array2) {
                
                model.shiPing=dic2[@"url"];
               
            }
            NSDictionary*user=group[@"user"];
            
            model.name=user[@"name"];
            model.touXiang=user[@"avatar_url"];
            
            NSDictionary*large_cover=group[@"large_cover"];
            NSArray*array3=large_cover[@"url_list"];
            for (NSDictionary*dic3 in array3) {
                
                model.shiPingZP=dic3[@"url"];
            }
            [_arrData addObject:model];
            
        }
        [_collect reloadData];
        [self.collect.mj_header endRefreshing];
        [self.collect.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
}


-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;{
    
    DuanYouXiuData* data=_arrData[indexPath.row];
    
    NSString *url = [NSString stringWithFormat:@"%@",data.shiPing];
    
    NSLog(@"______________%@",data.shiPing);
    
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
