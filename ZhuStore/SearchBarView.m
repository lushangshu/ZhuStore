//
//  SearchBarView.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/22.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "SearchBarView.h"
#import "PYSearch.h"
#import "GoodViewController.h"

@implementation SearchBarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *background = [UIView new];
        //NSLog(@"width is %f and height is %F",self.frame.size.width,self.frame.size.height);
        [background setBackgroundColor:[UIColor lightGrayColor]];
        background.alpha = 0.5;
        [self addSubview:background];
        background.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
        
        UIImageView *img = [[UIImageView alloc]init];
        [img setImage:[UIImage imageNamed:@"first"]];
        
        [self addSubview:img];
        img.sd_layout.leftSpaceToView(self,3).centerYEqualToView(self).widthIs(30).heightIs(30);
        
        _showLabel = [UILabel new];
        [self addSubview:_showLabel];
        
        _showLabel.sd_layout.leftSpaceToView(img,5).centerYEqualToView(img).topSpaceToView(self,3).rightSpaceToView(self,5).bottomSpaceToView(self,3);
        _showLabel.textAlignment = NSTextAlignmentLeft;
        [_showLabel setBackgroundColor:[UIColor lightGrayColor]];
        _showLabel.alpha = 0.4;
        searchBtn = [UIButton new];
        [self addSubview:searchBtn];
        searchBtn.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
        [searchBtn setBackgroundColor:[UIColor clearColor]];
        [searchBtn addTarget:self action:@selector(pySearchView) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


-(void)setUpSearchBarView{
   
}

-(void)pySearchView{
    
    NSLog(@"进入搜索界面");
    // 1. 创建热门搜索
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    // 2. 创建控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:NSLocalizedString(@"PYExampleSearchPlaceholderText", @"搜索编程语言") didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        // 开始搜索执行以下代码
        // 如：跳转到指定控制器
        [searchViewController.navigationController pushViewController:[[GoodViewController alloc] init] animated:YES];
    }];
    // 3. 设置风格
    
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault; // 搜索历史风格为default
    searchViewController.hotSearchStyle = PYHotSearchStyleDefault; // 热门搜索风格为默认
    
    // 4. 设置代理
    searchViewController.delegate = self;
    // 5. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [_vc presentViewController:nav animated:YES completion:nil];

}

#pragma mark - PYSearchViewControllerDelegate
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length) { // 与搜索条件再搜索
        // 根据条件发送查询（这里模拟搜索）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 搜索完毕
            // 显示建议搜索结果
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"搜索建议 %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
            // 返回
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}
@end
