//
//  HomePageVC.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "HomePageVC.h"
#import "GoodViewController.h"

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
    
    [self setUpUI];
}

-(void)createNavBar{
    
    navBar = [UIView new];
    [self.view addSubview:navBar];
    [navBar setBackgroundColor:COrange];
    
    navBar.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view,0).heightIs(64);
    navBar.alpha = 0;
    
}
-(void)setUpUI{
    mainTable = [UITableView new];
    [self.view addSubview:mainTable];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    mainTable.showsVerticalScrollIndicator = NO;
    mainTable.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
    
    [self createNavBar];
    
   

    
}
-(void)jumpGoods{
    NSLog(@"afasdfasd");
    GoodViewController *vc = [[GoodViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - contentOffset Calculation

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"tableview is scrolling %f",scrollView.contentOffset.y/100);
    
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
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section == 0) {
        _scroll = [BannerScrollView new];
        [cell addSubview:_scroll];
        _scroll.sd_layout.leftSpaceToView(cell,0).topSpaceToView(cell,0).heightIs(200).widthIs(ScreenW);
        
        [_scroll setUpbannerView];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 400;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
