//
//  MarketCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "MarketCell.h"
#import "SepLineView.h"


@implementation MarketCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}
-(void)initData{
    imageUrls = @[@"https://img2.ch999img.com/newstatic/544/1c738bfc4e6ce9.jpg?width=240&height=240",
                  @"https://img2.ch999img.com/newstatic/541/1b7b62d0b2fa80.jpg?width=240&height=240",
                  @"https://img2.ch999img.com/newstatic/543/1bf663cb9630d4.jpg?width=240&height=240",
                  @"https://img2.ch999img.com/newstatic/546/1c7359a7dfa2f3.jpg?width=240&height=240",
                  @"https://img2.ch999img.com/newstatic/545/1c72b9f51ee4cb.jpg?width=240&height=240",
                  @"https://img2.ch999img.com/newstatic/546/1c58f1c5ff41fd.jpg?width=240&height=240"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setUpUI{
    [self initData];
    
    UIView *titleBack = [UIView new];
    titleBack.backgroundColor=[UIColor whiteColor];
    [self addSubview:titleBack];
    titleBack.sd_layout.leftSpaceToView(self,0).topSpaceToView(self,0).heightIs(40).widthIs(ScreenW);
    
    UIView *colorView = [UIView new];
    [self addSubview:colorView];
    [colorView setBackgroundColor:[UIColor greenColor]];
    colorView.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,10).heightIs(20).widthIs(10);
    
    UIView *sepLine = [UIView new];
    sepLine = [SepLineView createSepLineView];
    [self addSubview:sepLine];
    sepLine.sd_layout.leftSpaceToView(self,0).topSpaceToView(colorView,10).heightIs(0.3);
    
    UILabel *title = [UILabel new];
    [self addSubview:title];
    title.sd_layout.leftSpaceToView(colorView,15).topSpaceToView(self,5).bottomSpaceToView(sepLine,5).widthIs(180);
    title.text = @"九机集市";
    title.font = [UIFont systemFontOfSize:18 weight:3];
    
    UILabel *adLabel = [UILabel new];
    UIButton *btn = [UIButton new];
    
    [self addSubview:adLabel];
    [self addSubview:btn];
    
    btn.sd_layout.rightSpaceToView(self,5).topSpaceToView(self,5).heightIs(30).widthIs(30);
    btn.backgroundColor = [UIColor lightGrayColor];
    
    adLabel.sd_layout.rightSpaceToView(btn,5).topSpaceToView(self,5).heightIs(30).widthIs(150);
    adLabel.text = @"更多二手商品";
    adLabel.textAlignment = NSTextAlignmentRight;
    adLabel.adjustsFontSizeToFitWidth = YES;
    adLabel.textColor = [UIColor lightGrayColor];
    
    deviceGallery = [UIScrollView new];
    [self addSubview:deviceGallery];
    deviceGallery.sd_layout.leftSpaceToView(self,0).widthIs(ScreenW).topSpaceToView(sepLine,0).heightIs(140);
    [deviceGallery setContentSize:CGSizeMake(imageUrls.count * 100, 0)];
    [deviceGallery setBackgroundColor:[UIColor whiteColor]];
    
    for (int i=0 ; i<imageUrls.count; i++) {
        UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(i*ScreenW/3, 0, ScreenW/3, 140)];
        [deviceGallery addSubview:baseView];
        
        UIImageView *image = [UIImageView new];
        [image sd_setImageWithURL:[NSURL URLWithString:imageUrls[i]] placeholderImage:nil];
        
        [baseView addSubview:image];
        image.sd_layout.topSpaceToView(baseView,5).leftSpaceToView(baseView,20).bottomSpaceToView(baseView,60).rightSpaceToView(baseView,20);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*ScreenW/3, 0, ScreenW/3, 140)];
        [deviceGallery addSubview:btn];
        
        UILabel *nameLabel = [UILabel new];
        [baseView   addSubview:nameLabel];
        nameLabel.sd_layout.topSpaceToView(image,2).leftEqualToView(image).widthIs(100).heightIs(18);
        nameLabel.textColor = [UIColor lightGrayColor];
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.text = @"酷派 8712 移动";
        nameLabel.textAlignment = NSTextAlignmentLeft;
        
        UILabel *priceLabel = [UILabel new];
        [baseView addSubview:priceLabel];
        priceLabel.sd_layout.topSpaceToView(nameLabel,0).leftEqualToView(image).widthIs(50).heightIs(13);
        priceLabel.textAlignment = NSTextAlignmentLeft;
        priceLabel.textColor = [UIColor orangeColor];
        priceLabel.text = @"￥120.00";
        priceLabel.backgroundColor = [UIColor whiteColor];
        priceLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    deviceGallery.showsHorizontalScrollIndicator = NO;
    
    
    [self setBackgroundColor:[UIColor whiteColor]];
    
}

@end
