//
//  ClassifyVC.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "ClassifyVC.h"
#import "SepLineView.h"
#import "LeftTableViewCell.h"
#import "RightTableTopCell.h"

@interface ClassifyVC ()

@end

@implementation ClassifyVC
- (void)viewDidLoad {
    [super viewDidLoad];
    selectIndex = 0;
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    model = [[ClassifyDataModel alloc]init];
    [model setUPData];
    [self createNavBar];
    [self createLeftTableView];
    [self createRightTableView];
}

-(void)createNavBar{
    
    navBar = [UIView new];
    [self.view addSubview:navBar];
    [navBar setBackgroundColor:sysRed];
    
    navBar.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view,0).heightIs(64);
    navBar.alpha = 0;
    
    locationSelect = [UIButton new];
    [self.view addSubview:locationSelect];
    locationSelect.sd_layout.topSpaceToView(self.view,20).leftSpaceToView(self.view,5).widthIs(40).heightIs(40);
    [locationSelect setBackgroundColor:[UIColor lightGrayColor]];
    //[locationSelect setBackgroundImage:[UIImage imageNamed:@"second"] forState:UIControlStateNormal];
    
    newsBtn = [UIButton new];
    [self.view addSubview:newsBtn];
    newsBtn.sd_layout.rightSpaceToView(self.view,5).topSpaceToView(self.view,20).heightIs(40).widthIs(40);
    [newsBtn setBackgroundColor:[UIColor lightGrayColor]];
    [newsBtn addTarget:self action:@selector(jumpToNewsVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    searchBar = [[SearchBarView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    searchBar.vc = self;
    [self.view addSubview:searchBar];
    searchBar.sd_layout.leftSpaceToView(locationSelect,10).topSpaceToView(self.view,20).rightSpaceToView(newsBtn,5).heightIs(40);
    
    
    lineView = [SepLineView new];
    [self.view addSubview:lineView];
    lineView.sd_layout.topSpaceToView(searchBar,5).leftSpaceToView(self.view,0).widthIs(ScreenW).heightIs(0.5);
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    
    //[searchBar setUpSearchBarView];
    
    
}
-(void)createLeftTableView{
    leftTable = [UITableView new];
    [self.view addSubview:leftTable];
    leftTable.sd_layout.leftSpaceToView(self.view,0).topSpaceToView(lineView,0).bottomSpaceToView(self.tabBarController.tabBar,0).widthIs(ScreenW/3.2);
    leftTable.delegate = self;
    leftTable.dataSource = self;
    [leftTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)createRightTableView{
    rightTable = [UITableView new];
    [self.view addSubview:rightTable];
    rightTable.sd_layout.leftSpaceToView(leftTable,0).topSpaceToView(lineView,0).bottomSpaceToView(self.tabBarController.tabBar,0).rightSpaceToView(self.view,0);
    rightTable.delegate = self;
    rightTable.dataSource = self;
    [rightTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}
-(void)jumpToNewsVC{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
}


#pragma mark - tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == leftTable) {
        return 6;
    }else{
        return 1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == leftTable) {
        return 1;
    }else{
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == leftTable) {
        return 60;
    }else{
        if (indexPath.section == 0) {
            return 120;
        }
        else return 250;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//以indexPath来唯一确定cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
    if (cell == nil) {
        
        if (tableView == leftTable) {
            LeftTableViewCell *cell = [[LeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.typeName.text = model.typeName[indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor whiteColor]];
            return cell;

        }else if(tableView == rightTable){
            if (indexPath.section == 0) {
                RightTableTopCell *cell = [[RightTableTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                [cell setBackgroundColor:[UIColor redColor]];
                [cell.img sd_setImageWithURL:[NSURL URLWithString:model.topImageUrls[selectIndex]] placeholderImage:nil];
                return cell;
            }else{
                
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                [cell setBackgroundColor:[UIColor yellowColor]];
                return cell;
            }
            
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == leftTable) {
        LeftTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.typeName.font = [UIFont systemFontOfSize:22];
        cell.typeName.textColor = [UIColor darkGrayColor];
        selectIndex = (int)indexPath.row;
        
        [rightTable reloadData];
    }else{
        
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == leftTable) {
        LeftTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.typeName.font = [UIFont systemFontOfSize:18];
        cell.typeName.textColor = [UIColor lightGrayColor];
    }else{
        
    }
}
@end
