//
//  CustomerCellView.h
//  SegementButton
//
//  Created by tunsuy on 27/2/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerCellView : UITableViewCell

@property (nonatomic, strong) UILabel *leftTitleLabel;
@property (nonatomic, strong) UITextField *midInputTextField;
@property (nonatomic, strong) UILabel *midAccessLabel;

- (instancetype) initWithCellType:(NSString *)cellType withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier;
- (void) setLeftTitleLabelWidthWithText:(NSString *)TextStr;

@end
