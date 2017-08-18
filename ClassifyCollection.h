//
//  ClassifyCollection.h
//  DiffLayoutCollection
//
//  Created by 张斌斌 on 2017/8/17.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GoodsListShowType) {
    singleLineShowOneGoods,
    signleLineShowDoubleGoods,
    
};

@interface ClassifyCollection : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign)GoodsListShowType  showType; //商品列表展现方式

@end
