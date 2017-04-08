//
//  ClassifyVC.h
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchBarView.h"
#import "SepLineView.h"
#import "ClassifyDataModel.h"

@interface ClassifyVC : UIViewController <UITableViewDelegate,UITableViewDataSource>

{
    UIView *navBar;
    UIButton *locationSelect;
    UIButton *newsBtn;
    SearchBarView *searchBar;
    SepLineView *lineView;
    
    UITableView *leftTable;
    UITableView *rightTable;
    
    ClassifyDataModel *model;
    
    int selectIndex; // 确定左侧选择类目的索引号
}
@end
