# YProgressView
# A round progress view with animation

in your view add this code
```
	YProgressView *view = [[YProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
	[view setProgressLineWidth:5];
	[view setStart:-90 End:180];
	[view setProgressColor:[UIColor orangeColor]];
	[view animationDuration:5];
	[view setTextColor:[UIColor lightGrayColor]];
	[view setCenterText:@"test"];
	[self.view addSubview:view];
```
<img src="http://i1.tietuku.com/c1e05dee478fb052.gif">

