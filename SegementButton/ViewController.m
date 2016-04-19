//
//  ViewController.m
//  SegementButton
//
//  Created by tunsuy on 26/2/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "ViewController.h"
#import "SegementView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *segementTitleArr = @[@"成交时间",@"销售阶段",@"最近更新",@"全部成员"];
    
    SegementView *segementView = [[SegementView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 44) withBtnTitleArr:segementTitleArr withSegementCount:4];

    [self.view addSubview:segementView];
    
    [segementView setSelectedSegementBtn:^(NSUInteger tag){
        [self segementBtnHandleWithTag:tag];
    }];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 40, 40)];
//    [btn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//    
//    UIImageView *lb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [lb setBackgroundColor:[UIColor redColor]];
//    lb.userInteractionEnabled = YES;
//    [btn addSubview:lb];
    
}

//- (void) test:(id)sender{
//    
//}

- (void) segementBtnHandleWithTag:(NSUInteger)tag{
    switch (tag) {
        case 1000:{
            UIAlertAction *alert = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
            UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"成交时间" message:@"你选择的！！！！" preferredStyle:UIAlertControllerStyleAlert];
            [alertCtrl addAction:alert];
            [self presentViewController:alertCtrl animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
