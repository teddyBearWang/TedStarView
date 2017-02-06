//
//  TedStarRateView.m
//  QCProject
//  ************星星评分控件***********
//  Created by apple on 16/11/28.
//  Copyright (c) 2016年 teddy. All rights reserved.
//

#import "TedStarRateView.h"

#define FOREGROUND_IMAGE_NAME @"star_yellow"
#define BACKGROUND_IMAGE_NAME @"star_gray"
#define STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2

@interface TedStarRateView()

@property (nonatomic, strong) UIView *foregroundStarView;

@property (nonatomic, strong) UIView *backgroundStarView;

@property (nonatomic, assign) NSInteger numberOfStars;

@end
@implementation TedStarRateView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStars:STAR_NUMBER];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfStars = numberOfStars;
        [self createUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _numberOfStars = STAR_NUMBER;
        [self createUI];
    }
    return self;
}

#pragma mark - private method
- (void)createUI
{
    _scorePercent = 1;//默认是1分
    _hasAnimation = NO;
    _allowInCompleteStar = NO;
    
    self.foregroundStarView = [self createStarViewWithImage:FOREGROUND_IMAGE_NAME];
    self.backgroundStarView = [self createStarViewWithImage:BACKGROUND_IMAGE_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture
{
    CGPoint taPoint = [gesture locationInView:self];
    CGFloat offset = taPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars); //占了多少星
    CGFloat starScore = self.allowInCompleteStar ? realStarScore : ceilf(realStarScore);
    self.scorePercent = starScore / self.numberOfStars;
}

- (UIView *)createStarViewWithImage:(NSString *)imageName
{
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (int i=0; i<self.numberOfStars; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * (self.bounds.size.width / self.numberOfStars), 0,self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak TedStarRateView *weakSelf = self;
    CGFloat animationtimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationtimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}

- (void)setScorePercent:(CGFloat)scorePercent
{
    if (_scorePercent == scorePercent) {
        return;
    }
    
    if (scorePercent < 0) {
        _scorePercent = 0;
    }else if (scorePercent > 1){
        _scorePercent = 1;
    }else{
        _scorePercent = scorePercent;
    }
    if ([self.delegate respondsToSelector:@selector(starRateView:scroePercentDidChange:)]) {
        [self.delegate starRateView:self scroePercentDidChange:scorePercent];
    }
    
    [self setNeedsLayout];
}

@end
