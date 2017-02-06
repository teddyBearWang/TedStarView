//
//  TedStarRateView.h
//  QCProject
//
//  Created by apple on 16/11/28.
//  Copyright (c) 2016年 teddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TedStarRateView;
@protocol CWStarRateViewDelegate <NSObject>
@optional
- (void)starRateView:(TedStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;
@end

@interface TedStarRateView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分，范围为0-1

@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画

@property (nonatomic, assign) BOOL allowInCompleteStar;//评分时是否允许不是整星

@property (nonatomic, weak) id<CWStarRateViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

@end
