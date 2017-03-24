//
//  BannerCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/24.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "BannerCell.h"
#import "SDCycleScrollView.h"
#import "GoodViewController.h"

@implementation BannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

-(void)setUpUI{
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
    
    for (int i=0; i<10; i++) {
        btn = [UIButton new];
        [self addSubview:btn];
        float size = (ScreenW - 30) / 5 ;
        if (i<5) {
            btn.sd_layout.topSpaceToView(cycleScrollView,10).leftSpaceToView(self,size*i+5*(i+1)).widthIs(size).heightIs(size);
        }else{
            btn.sd_layout.topSpaceToView(cycleScrollView,110).leftSpaceToView(self,size*(i-5)+5*(i-4)).widthIs(size).heightIs(size);
        }
        
        btn.layer.cornerRadius = 20;
        btn.layer.masksToBounds = YES;
        
        btn.backgroundColor = [UIColor yellowColor];
        
        btn.tag = i+1;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    

}

-(void)btnClick:(UIButton *)btn{
    
    NSInteger tag = btn.tag;
    NSLog(@"adfsadf");
    GoodViewController *vc = [[GoodViewController alloc]init];
    [_delegateVc.navigationController pushViewController:vc animated:YES];
    
    
    switch (tag) {
        case 1:
            
            break;
            
        default:
            break;
    }
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    //[_delegateVc pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
