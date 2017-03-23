//
//  BannerScrollView.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/22.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "BannerScrollView.h"
#import "SDCycleScrollView.h"

@implementation BannerScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setUpbannerView{
    [self setFrame:CGRectMake(0, 0, ScreenW, 400)];
    
    NSArray *urls = @[
                      @"https://img2.ch999img.com//pic/edt/ad/20170315/20170315104904_9602.jpg",
                      @"https://img2.ch999img.com//pic/edt/ad/20170310/20170310183831_0362.jpg",
                      @"https://img2.ch999img.com//pic/edt/ad/20170316/20170316171256_1885.jpg",
                      @"https://img2.ch999img.com//pic/edt/ad/20170310/20170310092630_1390.jpg",
                      @"https://img2.ch999img.com//pic/edt/ad/20170318/20170318165645_2423.jpg",
                      @"https://img2.ch999img.com//pic/edt/ad/20170317/20170317165027_4831.jpg"
                      ];
    NSArray *titles = @[@"1",
                        @"2",
                        @"3",
                        @"4",
                        @"5",
                        @"6",
                        @"7"
                        ];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, 200) delegate:_delegateVc placeholderImage:nil];
    
    cycleScrollView.imageURLStringsGroup = urls;
    //cycleScrollView.titlesGroup = titles;
    
    [self addSubview:cycleScrollView];
    
    for (int i=0; i<8; i++) {
        
    }
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    //[_delegateVc pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}


@end
