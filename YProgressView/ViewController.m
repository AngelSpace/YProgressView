//
//  ViewController.m
//  YProgressView
//
//  Created by Administrator on 8/2/15.
//  Copyright (c) 2015 yp. All rights reserved.
//

#import "ViewController.h"
#import "YProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	YProgressView *view = [[YProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
	[view setProgressLineWidth:5];
	[view setStart:-90 End:180];
	[view setProgressColor:[UIColor orangeColor]];
	[view animationDuration:5];
	[view setTextColor:[UIColor lightGrayColor]];
	[view setCenterText:@"test"];
	[self.view addSubview:view];
}

@end
