//
//  SegementView.h
//  SegementButton
//
//  Created by tunsuy on 26/2/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegementButton : UIButton

@property (nonatomic,strong) UILabel *btnTitleLabel;
@property (nonatomic,strong) UILabel *arrowLabel;

@end



@interface SegementView : UIView

@property (nonatomic,strong) UILabel *btnTitleLabel;
@property (nonatomic,strong) SegementButton *segementBtn;
//@property (nonatomic) NSUInteger segementCount;

@property (nonatomic, strong) void(^selectedSegementBtn)(NSUInteger tag);

- (instancetype) initWithFrame:(CGRect)frame withBtnTitleArr:(NSArray *)btnTitleArr withSegementCount:(NSUInteger)segementCount;

@end
