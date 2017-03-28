//
//  WebViewController.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/27.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "WebViewController.h"
#import "NavBarView.h"

@interface WebViewController () <UIWebViewDelegate>

@end

@implementation WebViewController
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NavBarView *navBar = [[NavBarView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 64)];
    navBar.title = self.webTitle;
    navBar.vc = self;
    [navBar.goBackBtn addTarget:self action:@selector(goBackVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBar];
    
    //self.title = @"打开网页";
    // Do any additional setup after loading the view.
    progressView = [UIProgressView new];
    
    webView = [UIWebView new];
    [self.view addSubview:progressView];
    [self.view addSubview:webView];
    
    progressView.backgroundColor = [UIColor greenColor];
    progressView.tintColor = [UIColor yellowColor];
    progressView.sd_layout.leftSpaceToView(self.view,0).topSpaceToView(navBar,0).widthIs(ScreenW).heightIs(10);
    webView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0).topSpaceToView(progressView,0);
    
    [webView setBackgroundColor:[UIColor whiteColor]];
    webView.delegate = self;
    [self loadUrl];
    [self.navigationController.navigationBar.backItem setTitle:@"返回"];
    
}

-(void)loadUrl{
    if ([_url isEqualToString:@""]) {
        _url = @"htts://www.9ji.com";
    }
    if([_webTitle isEqualToString:@""]){
        self.title = @"访问网页";
    }else{
        self.title = _webTitle;
    }
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    
}

-(void)timerCallback {
    if (theBool) {
        if (progressView.progress >= 1) {
            progressView.hidden = true;
            [myTimer invalidate];
        }
        else {
            progressView.progress += 0.1;
        }
    }
    else {
        progressView.progress += 0.05;
        if (progressView.progress >= 0.95) {
            progressView.progress = 0.95;
        }
    }
}

-(void)goBackVC{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - webview delegate
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    progressView.progress = 0;
    theBool = NO;
    //0.01667 is roughly 1/60, so it will update at 60 FPS
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    theBool = YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
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
