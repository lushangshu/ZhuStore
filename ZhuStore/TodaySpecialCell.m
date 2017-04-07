//
//  TodaySpecialCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "TodaySpecialCell.h"
#import "SepLineView.h"

@implementation TodaySpecialCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}
-(void)initData{
    imageUrls = @[@"https://img2.ch999img.com//pic/product/440x440/2016090919081365.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/20161027093528357.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/20161114100258618.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/20160929163037981.gif",
                  @"https://img2.ch999img.com//pic/product/440x440/20160324180107998.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/2016090919081365.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/20161027093528357.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/20161114100258618.jpg",
                  @"https://img2.ch999img.com//pic/product/440x440/20160929163037981.gif",
                  @"https://img2.ch999img.com//pic/product/440x440/20160324180107998.jpg"];
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
    [colorView setBackgroundColor:[UIColor purpleColor]];
    colorView.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,10).heightIs(20).widthIs(10);
    
    UIView *sepLine = [UIView new];
    sepLine = [SepLineView createSepLineView];
    [self addSubview:sepLine];
    sepLine.sd_layout.leftSpaceToView(self,0).topSpaceToView(colorView,10).heightIs(0.3);
    
    UILabel *title = [UILabel new];
    [self addSubview:title];
    title.sd_layout.leftSpaceToView(colorView,15).topSpaceToView(self,5).bottomSpaceToView(sepLine,5).widthIs(180);
    title.text = @"今日爆款";
    title.font = [UIFont systemFontOfSize:18 weight:3];
    
    UILabel *adLabel = [UILabel new];
    UIButton *btn = [UIButton new];
    
    [self addSubview:adLabel];
    [self addSubview:btn];
    
    btn.sd_layout.rightSpaceToView(self,5).topSpaceToView(self,5).heightIs(30).widthIs(30);
    btn.backgroundColor = [UIColor lightGrayColor];
    
    adLabel.sd_layout.rightSpaceToView(btn,5).topSpaceToView(self,5).heightIs(30).widthIs(150);
    adLabel.text = @"华为手表抄底价 赠手表";
    adLabel.adjustsFontSizeToFitWidth = YES;
    adLabel.textColor = [UIColor lightGrayColor];
    
    deviceGallery = [UIScrollView new];
    [self addSubview:deviceGallery];
    deviceGallery.sd_layout.leftSpaceToView(self,0).widthIs(ScreenW).topSpaceToView(sepLine,0).heightIs(140);
    [deviceGallery setContentSize:CGSizeMake(imageUrls.count * 100, 0)];
    [deviceGallery setBackgroundColor:[UIColor whiteColor]];
    
    for (int i=0 ; i<imageUrls.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(i*100, 0, 100, 100)];
        [image sd_setImageWithURL:[NSURL URLWithString:imageUrls[i]] placeholderImage:nil];
        
        [deviceGallery addSubview:image];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*100, 0, 100, 140)];
        [deviceGallery addSubview:btn];
        
        UILabel *nameLabel = [UILabel new];
        [deviceGallery addSubview:nameLabel];
        nameLabel.sd_layout.topSpaceToView(image,2).leftEqualToView(image).widthIs(100).heightIs(18);
        nameLabel.textColor = [UIColor lightGrayColor];
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.text = @"iPhone 7 双网通玫瑰金瑟";
        nameLabel.textAlignment = NSTextAlignmentLeft;
        
        UILabel *priceLabel = [UILabel new];
        [deviceGallery addSubview:priceLabel];
        priceLabel.sd_layout.topSpaceToView(nameLabel,0).leftEqualToView(image).widthIs(50).heightIs(13);
        priceLabel.textAlignment = NSTextAlignmentLeft;
        priceLabel.textColor = [UIColor orangeColor];
        priceLabel.text = @"￥4499.0";
        priceLabel.backgroundColor = [UIColor whiteColor];
        priceLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    deviceGallery.showsHorizontalScrollIndicator = NO;
    
    
    NSArray *adImgas = @[@"https://img2.ch999img.com/pic/clientimg/201609050451280.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201610080947030.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703011155430.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201612140242130.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201701240530100.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703160450200.jpg"];
    
   
    
    UIImageView *img_1 = [UIImageView new];
    UIImageView *img_2 = [UIImageView new];
    UIImageView *img_3 = [UIImageView new];
    UIImageView *img_4 = [UIImageView new];
    UIImageView *img_5 = [UIImageView new];
    UIImageView *img_6 = [UIImageView new];
    
    
    
    [self addSubview:img_1];
    [self addSubview:img_2];
    [self addSubview:img_3];
    [self addSubview:img_4];
    [self addSubview:img_5];
    [self addSubview:img_6];
    
    img_1.sd_layout.topSpaceToView(deviceGallery,10).leftSpaceToView(self,0).widthIs(ScreenW).heightIs(100);
    img_2.sd_layout.topSpaceToView(img_1,5).leftSpaceToView(self,5).widthIs((ScreenW-20)/3).heightIs(130);
    img_3.sd_layout.topSpaceToView(img_1,5).leftSpaceToView(img_2,5).widthIs((ScreenW-20)/3).heightIs(130);
    img_4.sd_layout.topSpaceToView(img_1,5).leftSpaceToView(img_3,5).widthIs((ScreenW-20)/3).heightIs(130);
    img_5.sd_layout.topSpaceToView(img_3,5).leftSpaceToView(self,0).widthIs(ScreenW/2).heightIs(100);
    img_6.sd_layout.topSpaceToView(img_3,5).leftSpaceToView(img_5,0).widthIs(ScreenW/2).heightIs(100);

    
    [img_1 sd_setImageWithURL:adImgas[0] placeholderImage:nil];
    [img_2 sd_setImageWithURL:adImgas[1] placeholderImage:nil];
    [img_3 sd_setImageWithURL:adImgas[2] placeholderImage:nil];
    [img_4 sd_setImageWithURL:adImgas[3] placeholderImage:nil];
    [img_5 sd_setImageWithURL:adImgas[4] placeholderImage:nil];
    [img_6 sd_setImageWithURL:adImgas[5] placeholderImage:nil];
    
    [self setBackgroundColor:CSepLine];
    
}

@end
