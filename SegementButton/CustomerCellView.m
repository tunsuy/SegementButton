//
//  CustomerCellView.m
//  SegementButton
//
//  Created by tunsuy on 27/2/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "CustomerCellView.h"

#define kLeftTitleLabelToCellLeft 15
#define kLeftTitleLabelToCellTop 10
#define kLeftTitleLabelToMidInputText 20
#define kMidInputTextToCellRight 15
#define kCustomerCellHeight 44
#define kFontOfSize 14

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HIGHT [UIScreen mainScreen].bounds.size.height

@implementation CustomerCellView

- (instancetype) initWithCellType:(NSString *)cellType withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier{
    if (self = [self initWithStyle:style reuseIdentifier:identifier]) {
        [self generateCellWithCellType:cellType];
    }
    return self;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void) generateCellWithCellType:(NSString *)cellType{
    self.leftTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftTitleLabelToCellLeft, kLeftTitleLabelToCellTop, 0, kCustomerCellHeight-kLeftTitleLabelToCellTop*2)];
    self.leftTitleLabel.font = [UIFont systemFontOfSize:kFontOfSize];
    [self addSubview:self.leftTitleLabel];
    if ([cellType  isEqual: @"inputCell"]) {
        self.midInputTextField = [[UITextField alloc] initWithFrame:CGRectMake(kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText, kLeftTitleLabelToCellTop, SCREEN_WIDTH-(kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText+kMidInputTextToCellRight), kCustomerCellHeight-kLeftTitleLabelToCellTop*2)];
        self.midInputTextField.font = [UIFont systemFontOfSize:kFontOfSize];
        [self addSubview:self.midInputTextField];
        
    }else if([cellType isEqual:@"accessCell"]){
        self.midAccessLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText, kLeftTitleLabelToCellTop, SCREEN_WIDTH-(kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText+kMidInputTextToCellRight), kCustomerCellHeight-kLeftTitleLabelToCellTop*2)];
        self.midAccessLabel.font = [UIFont systemFontOfSize:kFontOfSize];
        [self addSubview:self.midAccessLabel];
    }
}

- (void) setLeftTitleLabelWidthWithText:(NSString *)TextStr{
    CGSize size = [TextStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kFontOfSize]}];
    CGRect frame = self.leftTitleLabel.frame;
    frame.size.width = size.width;
    self.leftTitleLabel.frame = frame;
    
    frame = self.midInputTextField.frame;
    frame.origin.x = kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText;
    frame.size.width = SCREEN_WIDTH-(kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText+kMidInputTextToCellRight);
    self.midInputTextField.frame = frame;
    
    frame = self.midAccessLabel.frame;
    frame.origin.x = kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText;
    frame.size.width = SCREEN_WIDTH-(kLeftTitleLabelToCellLeft+self.leftTitleLabel.frame.size.width+kLeftTitleLabelToMidInputText+kMidInputTextToCellRight);
    self.midAccessLabel.frame = frame;
}

@end
