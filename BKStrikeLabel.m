//
//  BKStrikeLabel.m
//  bestkeep
//
//  Created by ForgetFairy on 2017/3/2.
//  Copyright © 2017年 utouu. All rights reserved.
//

#import "BKStrikeLabel.h"

@implementation BKStrikeLabel

- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
    
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size;
    
    CGFloat strikeWidth = textSize.width;
    
    CGRect lineRect = CGRectZero;
    
    if ([self textAlignment] == NSTextAlignmentRight){
        
        switch (self.strkeLineStyle) {
            case StrikeLineStyleMiddle:
                // 画线居中
                lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2, strikeWidth, 1);
                break;
            case StrikeLineStyleBottom:
                // 画线居下
                lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2 + textSize.height/2, strikeWidth, 1);
                break;
                
            default:
                break;
        }
        
    }else if ([self textAlignment] == NSTextAlignmentCenter){
        switch (self.strkeLineStyle) {
            case StrikeLineStyleMiddle:
                // 画线居中
                lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2, strikeWidth, 1);
                break;
            case StrikeLineStyleBottom:
                // 画线居下
                lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2 + textSize.height/2, strikeWidth, 1);
                break;
                
            default:
                break;
        }
    }else{
        switch (self.strkeLineStyle) {
            case StrikeLineStyleMiddle:
                // 画线居中
                lineRect = CGRectMake(0, rect.size.height/2, strikeWidth, 1);
                break;
            case StrikeLineStyleBottom:
                // 画线居下
                lineRect = CGRectMake(0, rect.size.height/2 + textSize.height/2, strikeWidth, 1);                break;
                
            default:
                break;
        }
    }
    
    if(self.strikeThroughEnabled){
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [self strikeThroughColor].CGColor);
        CGContextFillRect(context, lineRect);
    }else{
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
        CGContextFillRect(context, lineRect);
    }
}

@end
