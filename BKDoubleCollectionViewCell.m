//
//  BKDoubleCollectionViewCell.m
//  bestkeep
//
//  Copyright © 2016年 utouu. All rights reserved.
//

#import "BKDoubleCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "masonry.h"
#import "BKStrikeLabel.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

//这是双行cell的布局

@interface BKDoubleCollectionViewCell ()

@property (nonatomic, strong) UILabel *goodsNameLabel;
@property (nonatomic, strong) UILabel *goodsPriceLabel;
@property (nonatomic, strong) BKStrikeLabel *goodsMarketPriceLabel;
@property (nonatomic, strong) UIImageView *goodsImgeView;
@property (nonatomic, strong) UIImageView *CrossBorderAmoyImgView;//跨境淘
@property (nonatomic, strong) UIImageView *willSaleImgV;//即将上线
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation BKDoubleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        [self createUI];
        [self layout];
    }
    return self;
}
-(void)createUI{
    
    self.bgView = [UIView new];
    self.bgView.backgroundColor =[UIColor whiteColor];
    [self addSubview:self.bgView];
    //商品图片
    self.goodsImgeView = [[UIImageView alloc]init];
    self.goodsImgeView.image = [UIImage imageNamed:@"floor3"];
    [self.bgView addSubview:self.goodsImgeView];
    
    //即将上架标志
    self.willSaleImgV = [[UIImageView alloc]init];
    self.willSaleImgV.image = [UIImage imageNamed:@"goodsWillLine"];
    self.willSaleImgV.hidden = YES;
    [self.goodsImgeView addSubview:self.willSaleImgV];
    //商品描述
    self.goodsNameLabel = [[UILabel alloc]init];
    self.goodsNameLabel.numberOfLines = 1;
    self.goodsNameLabel.textColor = RGB(68, 68, 68);
    self.goodsNameLabel.font = [UIFont systemFontOfSize:14.0];
    self.goodsNameLabel.backgroundColor = [UIColor whiteColor];
    self.goodsNameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.goodsNameLabel.text=@"澳洲熏香抱枕";
    [self.bgView addSubview:self.goodsNameLabel];
    
    //全球购标志
    self.CrossBorderAmoyImgView = [[UIImageView alloc]init];
    self.CrossBorderAmoyImgView.hidden = YES;
    self.CrossBorderAmoyImgView.image = [UIImage imageNamed:@"GlobalPurchase"];
    [self.bgView addSubview:self.CrossBorderAmoyImgView];
    
    //商品价格
    self.goodsPriceLabel = [[UILabel alloc]init];
    self.goodsPriceLabel.textColor = RGB(255, 16, 16);
    self.goodsPriceLabel.font = [UIFont systemFontOfSize:16.0];
    self.goodsPriceLabel.backgroundColor = [UIColor whiteColor];
    self.goodsPriceLabel.text=@"$200.00";
    [self.bgView addSubview:self.goodsPriceLabel];
    
    self.goodsMarketPriceLabel = [BKStrikeLabel new];
    self.goodsMarketPriceLabel.font = [UIFont systemFontOfSize:13];
    self.goodsMarketPriceLabel.textColor = RGB(178, 178, 178);
    self.goodsMarketPriceLabel.text=@"$250.00";
    [self.bgView addSubview:self.goodsMarketPriceLabel];
    
    
    self.leftView = [UIView new];
    self.leftView.backgroundColor = RGB(218, 218, 218);
    [self.bgView addSubview:self.leftView];
    
    self.bottomView = [UIView new];
    self.bottomView.backgroundColor = RGB(218, 218, 218);
    [self.bgView addSubview:self.bottomView];
    
    
}
-(void)layout {
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    
    [_goodsImgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).offset(22.5);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width-47, self.bounds.size.width-47));
    }];
    
    [_willSaleImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(@(38));
        make.width.mas_equalTo(@(38));
    }];
    
    [_CrossBorderAmoyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.goodsImgeView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(14);
        make.size.mas_equalTo(CGSizeMake(42, 15));
    }];
    
    
    [_goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.goodsImgeView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(14);
        make.right.mas_equalTo(self.mas_right).offset(-14);
        make.height.equalTo(@20);
    }];
    
    [_goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.mas_left).offset(14);
        make.top.mas_equalTo(self.goodsNameLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(@(15));
    }];
    
    [_goodsMarketPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.goodsPriceLabel.mas_right).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.goodsPriceLabel.mas_bottom).offset(-2);
        make.height.mas_equalTo(@(10));
    }];
    
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left);
        make.top.equalTo(self.bgView.mas_top);
        make.bottom.equalTo(self.bgView.mas_bottom);
        make.width.equalTo(@0.5);
    }];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left);
        make.right.equalTo(self.bgView.mas_right);
        make.bottom.equalTo(self.bgView.mas_bottom);
        make.height.equalTo(@0.6);
    }];
}

//-(void)setDoubleGoodsModel:(BKManyClassfiySecondModel *)doubleGoodsModel{
//    
//    _doubleGoodsModel = doubleGoodsModel;
//    
//    [_goodsImgeView load:doubleGoodsModel.goodsCoverImg  placeholderImage:[UIImage imageNamed:@"AccountBitMap"]];
//    _goodsNameLabel.text = _doubleGoodsModel.goodsName;
//    //跨境淘
//    if ([doubleGoodsModel.channelType integerValue] == 2) {
//        self.CrossBorderAmoyImgView.hidden = NO;
//        [self setFirstLineTextIndentWithContent:self.goodsNameLabel firstLineHeadIndent:45];
//    }else {
//        self.CrossBorderAmoyImgView.hidden = YES;
//        [self setFirstLineTextIndentWithContent:self.goodsNameLabel firstLineHeadIndent:0];
//    }
//    //即将上线
//    if ([doubleGoodsModel.status integerValue] == 4) {
//        
//        self.willSaleImgV.hidden = NO;
//    }else {
//        self.willSaleImgV.hidden = YES;
//    }
//    //价格
//    if ([doubleGoodsModel.upText isEqualToString:@""] || doubleGoodsModel.upText == nil) {
//        
//        doubleGoodsModel.upText = @" ";
//    }
//    
//    _goodsPriceLabel.attributedText = [BKClassifyCommon specialStringStyle:[NSString stringWithFormat:@"¥%@%@", doubleGoodsModel.goodsPrice, doubleGoodsModel.upText] fontOfSize:13];
//    CGSize size = [self sizeWithContentString:_goodsPriceLabel.text];
//    [_goodsPriceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.mas_left).offset(14);
//        make.width.mas_equalTo(@(size.width));
//        make.top.mas_equalTo(self.goodsNameLabel.mas_bottom).offset(5);
//        make.height.mas_equalTo(@(15));
//    }];
//    
//    _goodsMarketPriceLabel.strkeLineStyle = StrikeLineStyleMiddle;
//    _goodsMarketPriceLabel.strikeThroughEnabled = YES;
//    _goodsMarketPriceLabel.strikeThroughColor = RGB(178, 178, 178);
//    _goodsMarketPriceLabel.text = [NSString stringWithFormat:@"￥%@",doubleGoodsModel.goodsMarketPrice];
//    
//}
//
//-(CGSize)sizeWithContentString:(NSString *)content{
//    
//    UIFont * font = [UIFont systemFontOfSize:16];
//    CGSize  size = CGSizeMake(1000, 15);
//    
//    return  [self sizeWithContentString:content textFont:font size:size];
//}
//
//-(CGSize)sizeWithContentString:(NSString *)content textFont:(UIFont *)font size:(CGSize)contentSize
//{
//    
//    NSDictionary * fontDict = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
//    CGRect rect = [content boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
//    
//    return rect.size;
//}
//
////设置首行缩进
//-(void)setFirstLineTextIndentWithContent:(UILabel*)contentLabel firstLineHeadIndent:(CGFloat)value
//{
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentLabel.text];
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:3];
//    paragraphStyle.firstLineHeadIndent= value;
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentLabel.text length])];
//    contentLabel.attributedText = attributedString;
//    contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
//}
//
@end
