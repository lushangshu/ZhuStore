//
//  RightTableTopCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/8.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "RightTableTopCell.h"

@implementation RightTableTopCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI{
    _img = [UIImageView new];
    [self addSubview:_img];
    _img.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,5).rightSpaceToView(self,10).bottomSpaceToView(self,5);
    if (![_imgUrl isEqualToString:@""]) {
        [_img sd_setImageWithURL:[NSURL URLWithString:_imgUrl] placeholderImage:nil];

    }else{
        [_img setBackgroundColor:[UIColor lightGrayColor]];
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
