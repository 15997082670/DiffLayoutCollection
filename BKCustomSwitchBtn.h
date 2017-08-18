//
//  BKCustomSwitchBtn.h
//  bestkeep
//
//  Created by utouu_mhm on 16/11/15.
//  Copyright © 2016年 utouu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BKCustomSwitchBtnDelegate <NSObject>

-(void)btnCurrentLocationOrignalY:(CGFloat)orignalY begainPoint:(CGPoint)point;

@end


@interface BKCustomSwitchBtn : UIButton

@property(nonatomic,assign)BOOL dragEnable;
@property(nonatomic,assign)BOOL adsorbEnable;
@property (nonatomic,assign)id<BKCustomSwitchBtnDelegate>myDelegate;


@end

