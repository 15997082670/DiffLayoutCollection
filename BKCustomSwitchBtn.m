
//
//  BKCustomSwitchBtn.m
//  bestkeep
//
//  Created by utouu_mhm on 16/11/15.
//  Copyright © 2016年 utouu. All rights reserved.
//

#import "BKCustomSwitchBtn.h"

#import <objc/runtime.h>
#define PADDING     10

@interface BKCustomSwitchBtn ()

@property (nonatomic,assign)CGFloat  offsetX;
@property (nonatomic,assign)CGFloat  offsetY;

@end



@implementation BKCustomSwitchBtn


CGPoint beginPoint;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    if (!self.dragEnable) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    self.highlighted = NO;
    if (!self.dragEnable) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint nowPoint = [touch locationInView:self];
    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beginPoint.x;
    //    float offsetY = nowPoint.y - beginPoint.y;
    
    if (fabs(offsetX ) == 0) {
        
        self.highlighted = YES;
    }
    
    if (self.highlighted) {
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
        self.highlighted = NO;
    }
    
    if (self.superview && self.adsorbEnable ) {
        float marginLeft = self.frame.origin.x;
        float marginRight = self.superview.frame.size.width - self.frame.origin.x - self.frame.size.width;
        float marginTop = self.frame.origin.y;
        float marginBottom = self.superview.frame.size.height - self.frame.origin.y - self.frame.size.height;
        
        [UIView animateWithDuration:0.2 animations:^(void){
            if (marginTop < 60) {
                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
                                        PADDING,
                                        self.frame.size.width,
                                        self.frame.size.height);
            }
            else if (marginBottom<60) {
                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
                                        self.superview.frame.size.height - self.frame.size.height-PADDING,
                                        self.frame.size.width,
                                        self.frame.size.height);
                
            }
            else {
                self.frame = CGRectMake(marginLeft<marginRight?PADDING:self.superview.frame.size.width - self.frame.size.width-PADDING,
                                        self.frame.origin.y,
                                        self.frame.size.width,
                                        self.frame.size.height);
            }
            
            if ([self.myDelegate respondsToSelector:@selector(btnCurrentLocationOrignalY:begainPoint:)]) {
                
                [self.myDelegate btnCurrentLocationOrignalY:self.frame.origin.y begainPoint:beginPoint];
            }
            
        }];
        
    }
}


@end
