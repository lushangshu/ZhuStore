//
//  AdvertiseViewController.m
//  FirstAdTest
//
//  Created by 百步iOS on 16/9/5.
//  Copyright © 2016年 百步iOS. All rights reserved.
//

#import "AdvertiseViewController.h"

@interface AdvertiseViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation AdvertiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"广告";
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.backgroundColor = [UIColor whiteColor];
    if (!self.adUrl || [self.adUrl isEqualToString:@""]) {
        self.adUrl = @"http://www.baidu.com";
    }
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.adUrl]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    NSLog(@"广告页面");
    }

- (void)setAdUrl:(NSString *)adUrl
{
    _adUrl = adUrl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
