//
//  TimeLimitCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/28.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "TimeLimitCell.h"
#import "WebViewController.h"
#import "SepLineView.h"
#import "UIImageView+WebCache.h"

@implementation TimeLimitCell

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
-(void)CreateTitleBar{
    UILabel *nameLabel = [UILabel new];
    [self addSubview:nameLabel];
    UILabel *subLabel = [UILabel new];
    [self addSubview:subLabel];
    UIView *line = [SepLineView createSepLineView];
    [self addSubview:line];
    line.sd_layout.topSpaceToView(nameLabel,5).leftSpaceToView(self,0).widthIs(ScreenW).heightIs(0.3);
    [nameLabel setText:@"限时抢购"];
    [nameLabel setFont:[UIFont systemFontOfSize:20 weight:2]];
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    [subLabel setText:@"正在进行"];
    [nameLabel setTextColor:[UIColor redColor]];
    [subLabel setTextColor:[UIColor redColor]];
    [subLabel setFont:[UIFont systemFontOfSize:15 weight:1]];
    [subLabel setTextAlignment:NSTextAlignmentLeft];
    
    nameLabel.sd_layout.leftSpaceToView(self,5).topSpaceToView(self,5).widthIs(100).heightIs(40);
    subLabel.sd_layout.leftSpaceToView(nameLabel,1).bottomSpaceToView(line,4).widthIs(80).heightIs(30);
    
    UIButton *moreBtn = [UIButton new];
    [self addSubview:moreBtn];
    moreBtn.sd_layout.rightSpaceToView(self,5).topSpaceToView(self,5).bottomSpaceToView(line,5).widthIs(80);
    [moreBtn setTitle:@"更多抢购" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal ];
    moreBtn.layer.borderColor= [UIColor lightGrayColor].CGColor;
    moreBtn.layer.borderWidth = 1.0;
    
    [moreBtn addTarget:self action:@selector(jumpToTimeLimit) forControlEvents:UIControlEventTouchUpInside];
    
    
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

-(void)setUpUI{
    [self CreateTitleBar];
    [self initData];
    
    deviceGallery = [UIScrollView new];
    [self addSubview:deviceGallery];
    deviceGallery.sd_layout.leftSpaceToView(self,0).widthIs(ScreenW).topSpaceToView(self,47).heightIs(180);
    [deviceGallery setContentSize:CGSizeMake(imageUrls.count * 120, 0)];
    [deviceGallery setBackgroundColor:[UIColor whiteColor]];
    
    for (int i=0 ; i<imageUrls.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(i*130, 0, 120, 120)];
        [image sd_setImageWithURL:[NSURL URLWithString:imageUrls[i]] placeholderImage:nil];
        
        [deviceGallery addSubview:image];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*130, 0, 120, 180)];
        [deviceGallery addSubview:btn];
        
        UILabel *nameLabel = [UILabel new];
        [deviceGallery addSubview:nameLabel];
        nameLabel.sd_layout.topSpaceToView(image,5).leftEqualToView(image).widthIs(120).heightIs(20);
        nameLabel.textColor = [UIColor lightGrayColor];
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.text = @"iPhone 7 双网通玫瑰金瑟";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *priceLabel = [UILabel new];
        [deviceGallery addSubview:priceLabel];
        priceLabel.sd_layout.topSpaceToView(nameLabel,2).centerXEqualToView(image).widthIs(100).heightIs(20);
        priceLabel.textAlignment = NSTextAlignmentCenter;
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.text = @"￥4499.0";
        priceLabel.backgroundColor = [UIColor redColor];
        priceLabel.layer.cornerRadius = 5;
        priceLabel.layer.masksToBounds =YES;
        
        UILabel *originPriceLabel = [UILabel new];
        [deviceGallery addSubview:originPriceLabel];
        originPriceLabel.sd_layout.topSpaceToView(priceLabel,2).leftEqualToView(image).widthIs(120).heightIs(10);
        originPriceLabel.textColor = [UIColor lightGrayColor];
        originPriceLabel.textAlignment = NSTextAlignmentCenter;
        originPriceLabel.font = [UIFont systemFontOfSize:9];
        
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@"￥5999.0"];
        [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, attri.length)];
        [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, attri.length)];
        [originPriceLabel setAttributedText:attri];
    }
    
    deviceGallery.showsHorizontalScrollIndicator = NO;
    
}


-(void)jumpToTimeLimit{
    NSLog(@"jumpToTimelimitVC");
}
@end
