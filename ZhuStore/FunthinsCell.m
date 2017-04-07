//
//  FunthinsCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "FunthinsCell.h"
#import "SepLineView.h"

@implementation FunthinsCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    
    return self;
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
    title.sd_layout.leftSpaceToView(colorView,15).topSpaceToView(self,5).bottomSpaceToView(sepLine,5).widthIs(100);
    title.text = @"智趣营";
    title.font = [UIFont systemFontOfSize:18 weight:3];
    
    
    imageUrls = @[@"https://img2.ch999img.com/pic/clientimg/201610111118190.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201702141020330.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703160211220.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201610120135510.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703170325110.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201611140146450.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201611250305540.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703140520540.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201609180529170.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201612281134530.jpg"];
    
    UIImageView *img_1 = [UIImageView new];
    UIImageView *img_2 = [UIImageView new];
    UIImageView *img_3 = [UIImageView new];
    UIImageView *img_4 = [UIImageView new];
    UIImageView *img_5 = [UIImageView new];
    UIImageView *img_6 = [UIImageView new];
    UIImageView *img_7 = [UIImageView new];
    UIImageView *img_8 = [UIImageView new];
    UIImageView *img_9 = [UIImageView new];
    UIImageView *img_10 = [UIImageView new];
    
    [self addSubview:img_1];
    [self addSubview:img_2];
    [self addSubview:img_3];
    [self addSubview:img_4];
    [self addSubview:img_5];
    [self addSubview:img_6];
    [self addSubview:img_7];
    [self addSubview:img_8];
    [self addSubview:img_9];
    [self addSubview:img_10];
    
    img_1.sd_layout.topSpaceToView(sepLine,0).leftSpaceToView(self,0).widthIs(ScreenW/2-0.25).heightIs(90);
    img_2.sd_layout.topSpaceToView(sepLine,0).leftSpaceToView(img_1,0.5).widthIs(ScreenW/2-0.25).heightIs(90);
    img_3.sd_layout.topSpaceToView(img_2,0.5).leftSpaceToView(self,0).widthIs((ScreenW-1.5)/4).heightIs(90);
    img_4.sd_layout.topSpaceToView(img_2,0.5).leftSpaceToView(img_3,0.5).widthIs((ScreenW-1.5)/4).heightIs(90);
    img_5.sd_layout.topSpaceToView(img_2,0.5).leftSpaceToView(img_4,0.5).widthIs((ScreenW-1.5)/4).heightIs(90);
    img_6.sd_layout.topSpaceToView(img_2,0.5).leftSpaceToView(img_5,0.5).widthIs((ScreenW-1.5)/4).heightIs(90);
    
    img_7.sd_layout.topSpaceToView(img_3,0.5).leftSpaceToView(self,0).widthIs((ScreenW-1.5)/4).heightIs(90);
    img_8.sd_layout.topSpaceToView(img_3,0.5).leftSpaceToView(img_7,0.5).widthIs((ScreenW-1.5)/4).heightIs(90);
    img_9.sd_layout.topSpaceToView(img_3,0.5).leftSpaceToView(img_8,0.5).widthIs((ScreenW-1.5)/4).heightIs(90);
    img_10.sd_layout.topSpaceToView(img_3,0.5).leftSpaceToView(img_9,0.5).widthIs((ScreenW-1.5)/4).heightIs(90);
    
    
    [img_1 sd_setImageWithURL:imageUrls[0] placeholderImage:nil];
    [img_2 sd_setImageWithURL:imageUrls[1] placeholderImage:nil];
    [img_3 sd_setImageWithURL:imageUrls[2] placeholderImage:nil];
    [img_4 sd_setImageWithURL:imageUrls[3] placeholderImage:nil];
    [img_5 sd_setImageWithURL:imageUrls[4] placeholderImage:nil];
    [img_6 sd_setImageWithURL:imageUrls[5] placeholderImage:nil];
    [img_7 sd_setImageWithURL:imageUrls[6] placeholderImage:nil];
    [img_8 sd_setImageWithURL:imageUrls[7] placeholderImage:nil];
    [img_9 sd_setImageWithURL:imageUrls[8] placeholderImage:nil];
    [img_10 sd_setImageWithURL:imageUrls[9] placeholderImage:nil];
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
}
@end
