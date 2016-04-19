//
//  TableViewController.m
//  SegementButton
//
//  Created by tunsuy on 27/2/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "TableViewController.h"
#import "SegementView.h"
#import "CustomerCellView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HIGHT [UIScreen mainScreen].bounds.size.height

#define kLeftTitle @"leftTitle"
#define kMidPlaceHolder @"midPlaceHolder"
#define kCellType @"cellType"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *uiData;
    UITableView *_tableView;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HIGHT) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self initUIData];
    
}

- (void) initUIData{
    uiData = @[
                        @[
                            @{kLeftTitle: @"名称",
                              kMidPlaceHolder: @"输入客户名称(必填)",
                              kCellType: @"inputCell"},
                            @{kLeftTitle: @"客户状态",
                              kCellType: @"accessCell"}],
                        @[
                            @{kLeftTitle: @"地址",
                              kMidPlaceHolder: @"输入客户地址",
                              kCellType: @"inputCell"},
                            @{kLeftTitle: @"客户分级",
                              kCellType: @"accessCell"}]
                        ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return uiData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [uiData[section] count];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        NSArray *segementTitleArr = @[@"成交时间",@"销售阶段",@"最近更新",@"全部成员"];
        
        SegementView *segementView = [[SegementView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) withBtnTitleArr:segementTitleArr withSegementCount:4];
        return segementView;
    }
    return tableView.tableHeaderView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *customerCellID = @"customerCellID";
    CustomerCellView *cell = [tableView dequeueReusableCellWithIdentifier:customerCellID];
    NSString *cellType = uiData[indexPath.section][indexPath.row][kCellType];
    if (!cell) {
        cell = [[CustomerCellView alloc] initWithCellType:cellType withStyle:UITableViewCellStyleDefault reuseIdentifier:customerCellID];
        [cell setLeftTitleLabelWidthWithText:uiData[indexPath.section][indexPath.row][kLeftTitle]];
        cell.leftTitleLabel.text = uiData[indexPath.section][indexPath.row][kLeftTitle];
        if ([cellType isEqual:@"inputCell"]) {
            cell.midInputTextField.placeholder = uiData[indexPath.section][indexPath.row][kMidPlaceHolder];
        }else if ([cellType isEqual:@"accessCell"]){
            
        }
    }
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"客户信息";
    }
    return @"";
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 44.0;
    }
    return 18.0;
}

@end
