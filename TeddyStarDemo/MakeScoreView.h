//
//  MakeScoreView.h
//  QCProject
//  ***********打分view***********
//  Created by apple on 16/11/28.
//  Copyright (c) 2016年 teddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MakeScoreView;
@protocol makeScoreDelegate <NSObject>

- (void)makeScoreView:(MakeScoreView *)scoreView withScore:(CGFloat)scorePercent;

@end

@interface MakeScoreView : UIView

@property (nonatomic, assign) id<makeScoreDelegate>delegate;

@end
