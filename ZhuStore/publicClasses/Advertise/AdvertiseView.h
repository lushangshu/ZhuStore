//
//  AdvertiseView.h
//  FirstAdTest
//
//  Created by 百步iOS on 16/9/5.
//  Copyright © 2016年 百步iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height
#define kUserDefaults [NSUserDefaults standardUserDefaults]

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

@interface AdvertiseView : UIView
/** 显示广告页面方法*/
- (void)show;

//图片路径
@property (nonatomic,copy)NSString *filePath;

@end
