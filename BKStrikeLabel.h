//
//  BKStrikeLabel.h
//  bestkeep
//
//  Created by ForgetFairy on 2017/3/2.
//  Copyright © 2017年 utouu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, StrikeLineStyle) {
    StrikeLineStyleMiddle,
    StrikeLineStyleBottom
};

@interface BKStrikeLabel : UILabel

@property (nonatomic, assign) StrikeLineStyle strkeLineStyle;

@property (nonatomic, assign) BOOL strikeThroughEnabled; // 是否画线

@property (nonatomic, strong) UIColor *strikeThroughColor; // 画线颜色

@end
