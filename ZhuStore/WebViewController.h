//
//  WebViewController.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/27.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

{
    UIWebView *webView;
    UIProgressView *progressView;
    
    BOOL theBool;
    NSTimer *myTimer;
}
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *webTitle;
@end
