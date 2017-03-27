//
//  HomePageVC.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "HomePageVC.h"
#import "GoodViewController.h"

#import "BannerCell.h"

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
    [navBar setBackgroundColor:COrange];
    
    navBar.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view,0).heightIs(64);
    navBar.alpha = 0;
    
    locationSelect = [UIButton new];
    [self.view addSubview:locationSelect];
    locationSelect.sd_layout.topSpaceToView(self.view,20).leftSpaceToView(self.view,5).widthIs(40).heightIs(40);
    [locationSelect setBackgroundColor:[UIColor blueColor]];
    //[locationSelect setBackgroundImage:[UIImage imageNamed:@"second"] forState:UIControlStateNormal];
    
    scanBtn = [UIButton new];
    [self.view addSubview:scanBtn];
    scanBtn.sd_layout.rightSpaceToView(self.view,5).topSpaceToView(self.view,20).heightIs(40).widthIs(40);
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
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    BannerCell *cell = [[BannerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section == 0) {
        [cell setUpUI];
        cell.delegateVc = self;
        
        
    }else if(indexPath.section == 1){
        //
    }else if(indexPath.section == 2){
        //
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 440;
    }else if(indexPath.section == 1){
        return 300;
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
