//
//  RecommandGoodsCell.h
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommandGoodsCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>


{
    UICollectionView *collection;
    
}

@property (nonatomic,strong) UIViewController *vc;

@end
