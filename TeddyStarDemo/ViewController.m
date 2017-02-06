//
//  ViewController.m
//  TeddyStarDemo
//
//  Created by apple on 17/2/6.
//  Copyright (c) 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MakeScoreView.h"

@interface ViewController ()<makeScoreDelegate>

@property (nonatomic, strong) MakeScoreView *scoreView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scoreView = [[MakeScoreView alloc] initWithFrame:CGRectMake(10, 20, 260, 40)];
    self.scoreView.layer.cornerRadius = 5.0f;
    self.scoreView.layer.masksToBounds = YES;
    self.scoreView.delegate = self;
    [self.view addSubview:self.scoreView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - makeScoreDelegate
- (void)makeScoreView:(MakeScoreView *)scoreView withScore:(CGFloat)scorePercent
{
    NSLog(@"评分时:%f",scorePercent);
}

@end
