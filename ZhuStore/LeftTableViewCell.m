//
//  LeftTableViewCell.m
//  ZhuStore
//
//  Created by zhuzai on 17/4/8.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI{
    _typeName = [UILabel new];
    [self addSubview:_typeName];
    _typeName.sd_layout.topSpaceToView(self,8).leftSpaceToView(self,5).rightSpaceToView(self,5).bottomSpaceToView(self,8);
    _typeName.textColor = [UIColor lightGrayColor];
    _typeName.textAlignment = NSTextAlignmentCenter;
    _typeName.font = [UIFont systemFontOfSize:18];
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
