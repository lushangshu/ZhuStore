//
//  HomePageVC.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "HomePageVC.h"
#import "GoodViewController.h"
#import "WebViewController.h"
#import "BannerCell.h"
#import "TimeLimitCell.h"
#import "NormalAdsCell.h"
#import "WearbleDeviceCell.h"
#import "TodaySpecialCell.h"
#import "AlwaysSurpriseCell.h"
#import "FunthinsCell.h"
#import "MarketCell.h"
#import "RecommandGoodsCell.h"

@interface HomePageVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


@end

@implementation HomePageVC
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"首页";
    [self setUpUI];
}

-(void)createNavBar{
    
    navBar = [UIView new];
    [self.view addSubview:navBar];
    [navBar setBackgroundColor:sysRed];
    
    navBar.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view,0).heightIs(64);
    navBar.alpha = 0;
    
    locationSelect = [UIButton new];
    [self.view addSubview:locationSelect];
    locationSelect.sd_layout.topSpaceToView(self.view,20).leftSpaceToView(self.view,5).widthIs(40).heightIs(40);
    [locationSelect setBackgroundColor:[UIColor blueColor]];
    //[locationSelect setBackgroundImage:[UIImage imageNamed:@"second"] forState:UIControlStateNormal];
    
    newsBtn = [UIButton new];
    [self.view addSubview:newsBtn];
    newsBtn.sd_layout.rightSpaceToView(self.view,5).topSpaceToView(self.view,20).heightIs(40).widthIs(40);
    [newsBtn setBackgroundColor:[UIColor brownColor]];
    [newsBtn addTarget:self action:@selector(jumpToNewsVC) forControlEvents:UIControlEventTouchUpInside];
    
    scanBtn = [UIButton new];
    [self.view addSubview:scanBtn];
    scanBtn.sd_layout.rightSpaceToView(newsBtn,5).topSpaceToView(self.view,20).heightIs(40).widthIs(40);
    [scanBtn setBackgroundColor:[UIColor yellowColor]];
    [scanBtn addTarget:self action:@selector(jumpGoods) forControlEvents:UIControlEventTouchUpInside];
    
    searchBar = [[SearchBarView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    searchBar.vc = self;
    [self.view addSubview:searchBar];
    searchBar.sd_layout.leftSpaceToView(locationSelect,10).topSpaceToView(self.view,20).rightSpaceToView(scanBtn,5).heightIs(40);

    
    
    //[searchBar setUpSearchBarView];
    
    
}
-(void)setUpUI{
    mainTable = [UITableView new];
    [self.view addSubview:mainTable];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    mainTable.showsVerticalScrollIndicator = NO;
    mainTable.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,44);
    
    [self createNavBar];
    
   

    
}
-(void)jumpGoods{
    NSLog(@"进入商品详情");
    GoodViewController *vc = [[GoodViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)jumpToNewsVC{
    NSLog(@"跳转到消息界面");
}
#pragma mark - contentOffset Calculation

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"tableview is scrolling %f",scrollView.contentOffset.y/100);
    
    navBar.alpha = scrollView.contentOffset.y/150;
}

#pragma mark - tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 9;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//以indexPath来唯一确定cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
    if (cell == nil) {
        if (indexPath.section == 0) {
            
            BannerCell *cell = [[BannerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegateVc = self;
            
            return cell;
            
            
        }else if(indexPath.section == 1){
            
            TimeLimitCell *cell = [[TimeLimitCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.vc = self;
            
            return cell;
            
            
        }else if(indexPath.section == 2){
            
            NormalAdsCell *cell = [[NormalAdsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.vc = self;
            return cell;
            
            
            
        }else if(indexPath.section == 3){
            
            WearbleDeviceCell *cell = [[WearbleDeviceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.vc = self;
            return cell;
            
        }else if(indexPath.section == 4){
            TodaySpecialCell *cell = [[TodaySpecialCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.vc = self;
            
            return cell;
        
        }else if(indexPath.section == 5){
            AlwaysSurpriseCell *cell = [[AlwaysSurpriseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.vc = self;
            
            return cell;
        }else if(indexPath.section == 6){
            FunthinsCell *cell = [[FunthinsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.vc = self;
            
            return cell;
        }else if(indexPath.section == 7){
            MarketCell *cell = [[MarketCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.vc = self;
            return cell;
        }else if(indexPath.section == 8){
            RecommandGoodsCell *cell = [[RecommandGoodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.vc = self;
            return cell;
        }
        else{
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            return cell;
        }
    }
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 400;
    }else if(indexPath.section == 1){
        return 230;
    }else if(indexPath.section == 2){
        return 400;
    }else if(indexPath.section == 3){
        return 385;
    }else if (indexPath.section ==4){
        return 530;
    }else if (indexPath.section ==5){
        return 385;
    }else if(indexPath.section == 6){
        return 310;
    }else if(indexPath.section == 7){
        return 160;
    }else if(indexPath.section ==8){
        return 890;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        WebViewController *vc = [[WebViewController alloc] init];
        vc.url = @"https://m.9ji.com/appRush.aspx";
        vc.webTitle =@"限时抢购";
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
