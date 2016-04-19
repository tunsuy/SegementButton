//
//  SegementView.m
//  SegementButton
//
//  Created by tunsuy on 26/2/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "SegementView.h"

#define kSegementHight 44
#define kTitleToSegementTop 10
#define kTitleToSegementLeft 15
#define kTitleToArrow 5
#define kArrowToSegementRight 15
#define kArrowWidth 5
#define kArrowHight 4
#define kSplitLineToSegementTop 5

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation SegementButton

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.btnTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTitleToSegementLeft, kTitleToSegementTop, 0, kSegementHight-kTitleToSegementTop*2)];
//        self.btnTitleLabel.userInteractionEnabled = YES;
        self.arrowLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTitleToSegementLeft+self.btnTitleLabel.frame.size.width+kTitleToArrow, self.frame.size.height/2+kArrowHight/2, kArrowWidth, kArrowHight)];
//
        [self addSubview:self.btnTitleLabel];
        [self addSubview:self.arrowLabel];

    }
    
    return self;
}

- (void) setSegementBTnTitleLabelWidthWithSegementCount:(NSUInteger)segementCount{

    CGRect btnTitleLabelFrame = self.btnTitleLabel.frame;
    btnTitleLabelFrame.size.width = SCREEN_WIDTH/segementCount;
    self.btnTitleLabel.frame = btnTitleLabelFrame;
}

@end

@implementation SegementView

- (instancetype) initWithFrame:(CGRect)frame withBtnTitleArr:(NSArray *)btnTitleArr withSegementCount:(NSUInteger)segementCount{
    if (self = [self initWithFrame:frame]) {
        [self generateSegementViewWithBtnTitleArr:btnTitleArr withSegementCount:segementCount];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self generateSegementView];
    }
    return self;
}

- (void) generateSegementViewWithBtnTitleArr:(NSArray *)btnTitleArr withSegementCount:(NSUInteger)segementCount{
    for (int i=0; i<segementCount; i++) {
        SegementButton *segementBtn = [[SegementButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/segementCount*i, 0, SCREEN_WIDTH/segementCount, self.frame.size.height)];
        segementBtn.backgroundColor = [UIColor grayColor];
        segementBtn.btnTitleLabel.text = btnTitleArr[i];
        segementBtn.btnTitleLabel.font = [UIFont systemFontOfSize:12.0];
        [segementBtn setSegementBTnTitleLabelWidthWithSegementCount:segementCount];
        segementBtn.tag = 1000+i;
        [segementBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:segementBtn];
    }
    for (int i=1; i<segementCount; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(SCREEN_WIDTH/segementCount*i, kSplitLineToSegementTop)];
        [path addLineToPoint:CGPointMake(SCREEN_WIDTH/segementCount*i, self.frame.size.height-kSplitLineToSegementTop)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.strokeColor = [UIColor blueColor].CGColor;
        [self.layer addSublayer:layer];
    }
}

- (void) selectedBtn:(id)sender{
    SegementButton *segementBtn = (SegementButton *)sender;
    self.selectedSegementBtn(segementBtn.tag);
}



@end
