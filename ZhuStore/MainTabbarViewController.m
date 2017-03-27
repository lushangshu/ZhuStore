//
//  MainTabbarViewController.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "HomePageVC.h"
#import "GoodViewController.h"
#import "ClassifyVC.h"
#import "AdImageTool.h"
#import "AdvertiseViewController.h"
#import "UserInfoVC.h"

@interface MainTabbarViewController ()
{
    NSArray *iconArray_normal;
    NSArray *iconArray_selected;
    NSArray *controllers;
    NSArray *nameArray;
}
@end

@implementation MainTabbarViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COrange,UITextAttributeTextColor,nil] forState:UIControlStateSelected];
    
    [self createTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createTabBar{
    iconArray_normal = @[@"first",@"first",@"first",@"first",@"first"];
    iconArray_selected = @[@"second",@"second",@"second",@"second",@"second"];
    controllers =  @[@"HomePageVC",@"ClassifyVC",@"GoodViewController",@"ClassifyVC",@"UserInfoVC"];
    nameArray =  @[@"首页",@"分类",@"九机集市",@"购物车",@"我的"];
    
    for (int i= 0; i<nameArray.count; i++) {
        Class class= NSClassFromString(controllers[i]);
        UIViewController *root = [[class alloc]init];
        
        
        root.tabBarItem.title = nameArray[i];
        root.tabBarItem.image = [[UIImage imageNamed:iconArray_normal[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        root.tabBarItem.selectedImage = [[UIImage imageNamed:iconArray_selected[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBar.tintColor = [UIColor blackColor];
        
        [self addChildViewController:root];
        
        
    }
    [self downloadAdImages];
    
}

-(void)addChildVc:(UIViewController *)childVc imageName:(NSString *)imageName SelectedImageName:(NSString *)selecteImageName{
    
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selecteImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (!is_IOS_7) {
        childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(27, 27, 27, 27);
        
    }
    self.tabBar.tintColor = [UIColor blackColor];
    
    [self addChildViewController:childVc];
}

-(void)downloadAdImages{
    
    NSString *url = @"https://img2.ch999img.com//pic/edt/ad/20170310/20170310183831_0362.jpg";
    [AdImageTool getAdvertisingImage: url];
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
