//
//  ViewController.m
//  DiffLayoutCollection
//
//  Created by 张斌斌 on 2017/8/17.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "BKCustomSwitchBtn.h"
#import "ClassifyCollection.h"

#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height
@interface ViewController ()<BKCustomSwitchBtnDelegate>
@property (nonatomic, strong) BKCustomSwitchBtn *changeShowTypeBtn;//转换cell布局的Btn
@property (nonatomic, assign) GoodsListShowType goodsShowType;
@property (nonatomic, strong) ClassifyCollection *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}


- (void)createUI{

    
    
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[ClassifyCollection alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout1];
    //self.collectionView.myDelegate = self;
    [self.view addSubview:self.collectionView];
    
    self.collectionView.showType = self.goodsShowType;
    
    
    //更换展示商品列表的按钮
    _changeShowTypeBtn = [[BKCustomSwitchBtn alloc]initWithFrame:CGRectZero];
    _changeShowTypeBtn.hidden = NO;
    _changeShowTypeBtn.selected = YES;
    _changeShowTypeBtn.myDelegate = self;
    [_changeShowTypeBtn setDragEnable:YES];
    [_changeShowTypeBtn setAdsorbEnable:YES];
    _changeShowTypeBtn.frame = CGRectMake(300, 200 + 5, 30, 30);
    [_changeShowTypeBtn addTarget:self action:@selector(changeShowTypeHome:) forControlEvents:UIControlEventTouchUpInside];
    [_changeShowTypeBtn setBackgroundImage:[UIImage imageNamed:@"商品列表样式1"] forState:UIControlStateNormal];
    [_changeShowTypeBtn setBackgroundImage:[UIImage imageNamed:@"商品列表样式2"] forState:UIControlStateSelected];
    [self.view addSubview:_changeShowTypeBtn];


}
#pragma mark - 更改展示样式
-(void)changeShowTypeHome:(UIButton *)btn{
    
    if (btn.isSelected) {
        btn.selected = NO;
       // self.goodsShowType = singleLineShowOneGoods;
        self.collectionView.showType =singleLineShowOneGoods;
        
    } else {
        btn.selected = YES;
       // self.goodsShowType = signleLineShowDoubleGoods;
        self.collectionView.showType =signleLineShowDoubleGoods;
    }
}
#pragma mark - 禁止切换btn位置在搜索条件栏上
-(void)btnCurrentLocationOrignalY:(CGFloat)orignalY begainPoint:(CGPoint)point{
//
//    if (self.backScrollView.frame.origin.y > orignalY) {
//        [UIView animateWithDuration:0.2 animations:^{
//            self.changeShowTypeBtn.frame = CGRectMake(ScreenWidth-40, self.backScrollView.frame.origin.y + 5, 30, 30);
//        }];
//    }
}
@end
