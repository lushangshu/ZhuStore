//
//  AlwaysSurpriseCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/7.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "AlwaysSurpriseCell.h"
#import "SepLineView.h"
@implementation AlwaysSurpriseCell

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
    [colorView setBackgroundColor:[UIColor orangeColor]];
    colorView.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,10).heightIs(20).widthIs(10);
    
    UIView *sepLine = [UIView new];
    sepLine = [SepLineView createSepLineView];
    [self addSubview:sepLine];
    sepLine.sd_layout.leftSpaceToView(self,0).topSpaceToView(colorView,10).heightIs(0.3);
    
    UILabel *title = [UILabel new];
    [self addSubview:title];
    title.sd_layout.leftSpaceToView(colorView,15).topSpaceToView(self,5).bottomSpaceToView(sepLine,5).widthIs(100);
    title.text = @"总有惊喜";
    title.font = [UIFont systemFontOfSize:18 weight:3];
    
    
    imageUrls = @[@"https://img2.ch999img.com/pic/clientimg/201703081005070.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703140517040.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703091203150.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703220925100.jpg",
                  @"https://img2.ch999img.com/pic/clientimg/201703100553400.jpg"];
    
    NSArray *imgs =  @[@"img_1",@"img_2",@"img_3",@"img_4",@"img_5"];
    
    UIImageView *img_1 = [UIImageView new];
    UIImageView *img_2 = [UIImageView new];
    UIImageView *img_3 = [UIImageView new];
    UIImageView *img_4 = [UIImageView new];
    UIImageView *img_5 = [UIImageView new];
    
    [self addSubview:img_1];
    [self addSubview:img_2];
    [self addSubview:img_3];
    [self addSubview:img_4];
    [self addSubview:img_5];
    
    img_1.sd_layout.topSpaceToView(sepLine,0).leftSpaceToView(self,0).widthIs(ScreenW/2-0.5).heightIs(230);
    img_2.sd_layout.topSpaceToView(sepLine,0).leftSpaceToView(img_1,0.5).widthIs(ScreenW/2-0.5).heightIs(115);
    img_3.sd_layout.topSpaceToView(img_2,0.5).leftSpaceToView(img_1,0.5).widthIs(ScreenW/2-0.5).heightIs(114.5);
    img_4.sd_layout.topSpaceToView(img_1,0.5).leftSpaceToView(self,0).widthIs(ScreenW/2-0.5).heightIs(115);
    img_5.sd_layout.topSpaceToView(img_3,0.5).leftSpaceToView(img_4,0.5).widthIs(ScreenW/2-0.5).heightIs(115);
    
    
    [img_1 sd_setImageWithURL:imageUrls[0] placeholderImage:nil];
    [img_2 sd_setImageWithURL:imageUrls[1] placeholderImage:nil];
    [img_3 sd_setImageWithURL:imageUrls[2] placeholderImage:nil];
    [img_4 sd_setImageWithURL:imageUrls[3] placeholderImage:nil];
    [img_5 sd_setImageWithURL:imageUrls[4] placeholderImage:nil];
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
}


@end
