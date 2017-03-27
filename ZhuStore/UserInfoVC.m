//
//  UserInfoVC.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/27.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "UserInfoVC.h"

@interface UserInfoVC ()

@end

@implementation UserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
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
