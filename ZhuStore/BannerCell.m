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
#import "WebViewController.h"

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
    NSArray *nameArray = @[@"附近门店",
                           @"会员俱乐部",
                           @"稀奇集中营",
                           @"一手优品",
                           @"旧机回收",
                           @"九机快修",
                           @"试用中心",
                           @"为你优选",
                           @"充值中心",
                           @"全部"];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, 200) delegate:_delegateVc placeholderImage:nil];
    
    cycleScrollView.imageURLStringsGroup = urls;
    //cycleScrollView.titlesGroup = titles;
    
    [self addSubview:cycleScrollView];
    
    for (int i=0; i<10; i++) {
        btn = [UIButton new];
        nameLabel = [UILabel new];
        
        [self addSubview:nameLabel];
        [self addSubview:btn];
        float size = (ScreenW - 100) / 5 ;
        if (i<5) {
            btn.sd_layout.topSpaceToView(cycleScrollView,10).leftSpaceToView(self,size*i+10*(2*i+1)).widthIs(size).heightIs(size);
            nameLabel.sd_layout.topSpaceToView(btn,2).leftSpaceToView(self,size*i+10*(2*i+1)).widthIs(size).heightIs(10);
        }else{
            btn.sd_layout.topSpaceToView(cycleScrollView,110).leftSpaceToView(self,size*(i-5)+10*(2*(i-5)+1)).widthIs(size).heightIs(size);
            nameLabel.sd_layout.topSpaceToView(btn,2).leftSpaceToView(self,size*(i-5)+10*(2*(i-5)+1)).widthIs(size).heightIs(10);
        }
        
        nameLabel.font = [UIFont systemFontOfSize:10];
        nameLabel.textAlignment = UITextAlignmentCenter;
        
        nameLabel.text = nameArray[i];
        nameLabel.textColor = [UIColor lightGrayColor];
        btn.layer.cornerRadius = 20;
        btn.layer.masksToBounds = YES;
        
        btn.backgroundColor = [UIColor yellowColor];
        
        btn.tag = i+1;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    lineView = [UIView new];
    [self addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(self,0).topSpaceToView(cycleScrollView,200).widthIs(ScreenW).heightIs(0.5);
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    [self createScrollView];
    
}

-(void)createScrollView{
    UILabel *label1 = [UILabel new];
    UILabel *label2 = [UILabel new];
    [self addSubview:label1];
    [self addSubview:label2];
    label1.sd_layout.topSpaceToView(lineView,10).leftSpaceToView(self,2).widthIs(40).heightIs(20);
    label2.sd_layout.topSpaceToView(lineView,10).leftSpaceToView(label1,2).widthIs(40).heightIs(20);
    
    [label1 setText:@"9机"];
    [label2 setText:@"头条"];
    label2.textAlignment = NSTextAlignmentCenter;
    [label1 setTextColor:[UIColor blackColor]];
    [label1 setTextAlignment:NSTextAlignmentRight];
    [label2 setBackgroundColor:[UIColor redColor]];
    [label2 setTextColor:[UIColor whiteColor]];
    
    [label2.layer setMasksToBounds:YES];
    [label2.layer setCornerRadius:4.0];
    
    
    UIView *seplineView = [UIView new];
    //[self addSubview:seplineView];
    seplineView.sd_layout.leftSpaceToView(label2,5).topSpaceToView(lineView,5).widthIs(0.5).heightIs(30);
    [seplineView setBackgroundColor:[UIColor lightGrayColor]];
    
    UIButton *moreBtn = [UIButton new];
    [self addSubview:moreBtn];
    moreBtn.sd_layout.rightSpaceToView(self,5).topSpaceToView(lineView,5).widthIs(60).heightIs(30);
    [moreBtn setBackgroundColor:[UIColor whiteColor] ];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    moreBtn.layer.borderWidth = 0.5;
    moreBtn.layer.cornerRadius = 4;
    moreBtn.layer.masksToBounds = YES;
    moreBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //_moreBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    NSMutableArray *title = [[NSMutableArray alloc]init];
    for(int i=0;i<5;i++){
        [title addObject:@"news"];
    }
    //_sCroll = [BBHotTopicScroll new];
    _sCroll = [[BBHotTopicScroll alloc]initWithFrame:CGRectMake(100, 410, 200, 40)];
    
    [self addSubview:_sCroll];
    _sCroll.sd_layout.leftSpaceToView(label2,5).rightSpaceToView(moreBtn,5).topSpaceToView(lineView,0).heightIs(30);
    _sCroll.titleArray = [NSArray arrayWithObjects:@"电信合约机4G",@"苹果iPhone 7 plus",@"充电五分钟 通话两小时",@"华为 Nova 香槟金色", nil];
    //_sCroll.titleArray = title;
    _sCroll.titleFont = 15;
    _sCroll.titleColor = [UIColor darkGrayColor];
    _sCroll.BGColor = [UIColor whiteColor];
    [_sCroll clickTitleLabel:^(NSInteger index,NSString *titleString) {
        //NSLog(@"%ld-----%@",index,titleString);
        WebViewController *web=[[WebViewController alloc] init];
        web.url=@"";
        _delegateVc.navigationController.navigationBarHidden=NO;
        web.hidesBottomBarWhenPushed=YES;
        [_delegateVc.navigationController pushViewController:web animated:YES];
    }];
    
    
    [self.layer setCornerRadius:10.0];
    [self.layer setMasksToBounds:YES];
}

-(void)btnClick:(UIButton *)btn{
    
    NSInteger tag = btn.tag;
    NSLog(@"adfsadf");
   
    switch (tag) {
        case 1:
        {
            GoodViewController *vc = [[GoodViewController alloc]init];
            [_delegateVc.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 10:
        {
            WebViewController *vc = [[WebViewController alloc]init];
            vc.url = @"https://m.9ji.com/menu.aspx?from=tb10";
            vc.title = @"贴心的九机";
            [_delegateVc.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(void)moreBtnClick{
    
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
