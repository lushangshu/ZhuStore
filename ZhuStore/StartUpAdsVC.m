//
//  StartUpAdsVC.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/23.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "StartUpAdsVC.h"
#import "MainTabbarViewController.h"

@interface StartUpAdsVC () <UIScrollViewDelegate >

@property(nonatomic,strong) UIScrollView *scroll;
@property(nonatomic,strong) UIPageControl *pageControl;

@end

@implementation StartUpAdsVC
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.navigationBar setHidden:YES];
    [self setUpUI];
    
    // Do any additional setup after loading the view.
    
}

-(void)setUpUI{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"NO" forKey:@"isFirstLogin"];
    [defaults synchronize];
    self.scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _scroll.backgroundColor = [UIColor lightGrayColor];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.delegate = self;
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(ScreenW/4, ScreenH-60, ScreenW/2, 40)];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.numberOfPages = 3;
    
    [self.view addSubview:_scroll];
    [self.view addSubview:_pageControl];
    
    [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
    
    NSArray *imgs = @[@"launchImage",@"launchImage",@"launchImage"];
    
    for (int i = 0; i <3; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenW *i , 0, ScreenW, ScreenH)];
        image.image = [UIImage imageNamed:imgs[i]];
        
        image.userInteractionEnabled = YES;
        [_scroll addSubview:image];
        
        UITapGestureRecognizer *swipeLeftGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAction:)];
        [image addGestureRecognizer:swipeLeftGesture];
    }
    
    _scroll.contentSize = CGSizeMake(ScreenW *3, 0);
    _scroll.pagingEnabled =YES;
    _scroll.bounces = NO;
}

#pragma mark - swipe
-(void)swipeGestureAction:(UITapGestureRecognizer *)swipe{
    MainTabbarViewController *tab = [[MainTabbarViewController alloc]init];
    [self.navigationController pushViewController:tab animated:YES];
    //[self presentViewController:tab animated:YES completion:nil];
    
}

-(void)setPageControl:(UIPageControl *)pageControl{
    _scroll.contentOffset = CGPointMake(pageControl.currentPage * _scroll.frame.size.width, 0);
    CGRect frame = _scroll.frame;
    frame.origin.x = frame.size.width *pageControl.currentPage;
    frame.origin.y = 0;
    
    [_scroll scrollRectToVisible:frame animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = scrollView.contentOffset.x/ScreenW;
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
