//
//  YProgressView.h
//  YProgressView
//
//  Created by Administrator on 8/2/15.
//  Copyright (c) 2015 yp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YProgressView : UIView

- (void)setProgressLineWidth:(float)width;
- (void)setStart:(float)start End:(float)end;
- (void)animationDuration:(float)duration;
- (void)setCenterText:(NSString *)text;

- (void)setBackColor:(UIColor *)color;
- (void)setCenterColor:(UIColor *)color;
- (void)setProgressColor:(UIColor *)color;
- (void)setTextColor:(UIColor *)color;

@end
