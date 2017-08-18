//
//  ClassifyCollection.m
//  DiffLayoutCollection
//
//  Created by 张斌斌 on 2017/8/17.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ClassifyCollection.h"

#import "BKDoubleCollectionViewCell.h"

#import "BKSingleCollectionViewCell.h"
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
@implementation ClassifyCollection

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.backgroundColor = RGB(242, 242, 242);
        self.dataSource = self;
        self.delegate = self;
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[BKDoubleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([BKDoubleCollectionViewCell class])];
        [self registerClass:[BKSingleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([BKSingleCollectionViewCell class])];
          }
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.showType == singleLineShowOneGoods) {
        
        BKSingleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BKSingleCollectionViewCell class]) forIndexPath:indexPath];
        //cell.singleGoodsModel = self.dataArray[indexPath.row];
        return cell;
    }else{
        
        BKDoubleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BKDoubleCollectionViewCell class]) forIndexPath:indexPath];
        //cell.doubleGoodsModel = self.dataArray[indexPath.row];
        return cell;
        
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.showType == singleLineShowOneGoods) {
        
        return CGSizeMake(ScreenWidth, 117);
    } else {
        CGFloat height = ScreenWidth * 228/375.0f;
        return CGSizeMake(ScreenWidth/2.0-0.5, height);
    }
    
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0.001f;

}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0.001f;
}


#pragma mark - set方法
-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self reloadData];
}

-(void)setShowType:(GoodsListShowType)showType
{
    _showType = showType;
    [self reloadData];
}

@end
