//
//  YProgressView.m
//  YProgressView
//
//  Created by Administrator on 8/2/15.
//  Copyright (c) 2015 yp. All rights reserved.
//

#import "YProgressView.h"

@interface YProgressView ()

@property (nonatomic, retain) UIColor *backColor;
@property (nonatomic, retain) UIColor *centerColor;
@property (nonatomic, retain) UIColor *progressColor;
@property (nonatomic, retain) UIColor *textColor;

@property (nonatomic, assign) float viewWidth;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, assign) float startDegree;
@property (nonatomic, assign) float endDegree;
@property (nonatomic, assign) float animationDuration;
@property (nonatomic, retain) NSString *centerText;
@end

@implementation YProgressView
@synthesize backColor, centerColor, progressColor, textColor;
@synthesize viewWidth, lineWidth;
@synthesize startDegree, endDegree, animationDuration;
@synthesize centerText;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self) {
		self.backgroundColor = [UIColor clearColor];
		viewWidth = frame.size.width;
	}

	return self;
}

- (void)drawRect:(CGRect)rect
{
	[self drawView];
}

- (void)setProgressLineWidth:(float)width
{
	lineWidth = width;
}

- (void)setStart:(float)start End:(float)end
{
	startDegree = start;
	endDegree = end;
	[self setNeedsDisplay];
}

- (void)animationDuration:(float)duration
{
	animationDuration = duration;
}

- (void)setCenterText:(NSString *)text
{
	centerText = text;
}

- (void)setBackColor:(UIColor *)color
{
	backColor = color;
}

- (void)setCenterColor:(UIColor *)color
{
	centerColor = color;
}

- (void)setProgressColor:(UIColor *)color
{
	progressColor = color;
}

- (void)setTextColor:(UIColor *)color
{
	textColor = color;
}

- (void)drawView
{
	// add background layer
	CALayer *backLayer = [CALayer layer];
	backLayer.frame = CGRectMake(0, 0, viewWidth, viewWidth);
	backLayer.backgroundColor = (backColor == nil ? [UIColor lightGrayColor] : backColor).CGColor;
	backLayer.cornerRadius = viewWidth / 2;
	[self.layer addSublayer:backLayer];

	// add center layer
	CALayer *centerLayer = [CALayer layer];
	centerLayer.frame = CGRectMake(lineWidth, lineWidth, viewWidth - lineWidth * 2, viewWidth - lineWidth * 2);
	centerLayer.backgroundColor = (centerColor == nil ? [UIColor whiteColor] : centerColor).CGColor;
	centerLayer.cornerRadius = (viewWidth - lineWidth * 2) / 2;
	[self.layer addSublayer:centerLayer];

	// add center label
	UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(lineWidth, lineWidth, viewWidth - lineWidth * 2, viewWidth - lineWidth * 2)];
	[centerLabel setTextAlignment:NSTextAlignmentCenter];
	centerLabel.textColor = textColor == nil ? [UIColor blackColor] : textColor;
	centerLabel.text = centerText == nil ? @"" : centerText;
	[self addSubview:centerLabel];

	CAShapeLayer *progressLayer = [CAShapeLayer layer];
	progressLayer.frame = self.bounds;
	[self.layer addSublayer:progressLayer];
	progressLayer.fillColor = [[UIColor clearColor] CGColor];
	progressLayer.strokeColor = (progressColor == nil ? [UIColor redColor] : progressColor).CGColor;
	progressLayer.lineWidth = lineWidth;
	UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(viewWidth / 2, viewWidth / 2) radius:(viewWidth - lineWidth) / 2  startAngle:M_PI * startDegree / 180.0 endAngle:M_PI * endDegree / 180.0 clockwise:YES];
	progressLayer.path = [path CGPath];

	// add animition
	CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	pathAnimation.duration = animationDuration;
	pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
	pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
	[progressLayer addAnimation:pathAnimation forKey:nil];
}

@end
