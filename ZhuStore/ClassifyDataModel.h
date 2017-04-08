//
//  ClassifyDataModel.h
//  ZhuStore
//
//  Created by zhuzai on 17/4/8.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassifyDataModel : NSObject


@property (nonatomic,strong) NSArray *typeName;
@property (nonatomic,strong) NSArray *topImageUrls;
@property (nonatomic,strong) NSMutableDictionary *imgsDic;

-(void)setUPData;

@end
