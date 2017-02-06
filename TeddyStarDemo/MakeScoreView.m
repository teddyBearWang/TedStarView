//
//  MakeScoreView.m
//  QCProject
//
//  Created by apple on 16/11/28.
//  Copyright (c) 2016年 teddy. All rights reserved.
//

#import "MakeScoreView.h"
#import "TedStarRateView.h"
#import "Masonry.h"

@interface MakeScoreView()<CWStarRateViewDelegate>

@property (nonatomic, strong) UILabel *titlelabel;

@property (nonatomic, strong) TedStarRateView *starRateView;
@end

@implementation MakeScoreView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titlelabel.text = @"   评分";
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.bottom.equalTo(self).offset(0);
        make.width.mas_equalTo(self.bounds.size.width/3);
    }];
    self.starRateView.backgroundColor = [UIColor clearColor];

}

#pragma mark -  CWStarRateViewDelegate
- (void)starRateView:(TedStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent
{
    if (_delegate && [_delegate respondsToSelector:@selector(makeScoreView:withScore:)]) {
        [_delegate makeScoreView:self withScore:newScorePercent];
    }
}

#pragma mark - setter and getter 
- (UILabel *)titlelabel
{
    if (!_titlelabel) {
        _titlelabel = [UILabel new];
        _titlelabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titlelabel];
    }
    return _titlelabel;
}

- (TedStarRateView *)starRateView
{
    if (!_starRateView) {
        _starRateView = [[TedStarRateView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2-10, 0, self.bounds.size.width/2, self.bounds.size.height) numberOfStars:5];
        _starRateView.scorePercent = 1.0f;
        _starRateView.delegate = self;
        _starRateView.allowInCompleteStar = YES;
        _starRateView.hasAnimation = YES;
        [self addSubview:_starRateView];
    }
    return _starRateView;
}

@end
