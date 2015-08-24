//
//  Slider1.m
//  DemoUIView
//
//  Created by du phung cong on 8/23/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "Slider1.h"

@interface Slider1 ()

@end

@implementation Slider1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView* sliderBackground = [[UIView alloc] init];
    
    CGRect sliderBackgroundFrame = sliderBackground.frame;
    
    sliderBackgroundFrame.size = CGSizeMake(106.0, 36.0);
    sliderBackgroundFrame.origin = CGPointMake(50.0, 200.0);
    sliderBackground.frame = sliderBackgroundFrame;
    sliderBackground.center = self.view.center;
    sliderBackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"slider1-slider-bg.jpg"]];
    
    [self.view addSubview:sliderBackground];
    
    UISlider* slider = [[UISlider alloc] init];
    CGRect sliderFrame = slider.frame;
    sliderFrame.size = CGSizeMake(80.0, 15.0);
    slider.frame = sliderFrame;
    slider.center = [sliderBackground convertPoint:sliderBackground.center fromView:sliderBackground.superview];
    
    [sliderBackground addSubview:slider];
    
    [slider setThumbImage:[UIImage imageNamed:@"slider1-thumb.png"] forState:UIControlStateNormal];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 5);
    UIImage* maxTrack = [[UIImage imageNamed: @"slider1-track.png"] resizableImageWithCapInsets:inset];
    UIImage* minTrack = [[UIImage imageNamed: @"slider1-track.png"] resizableImageWithCapInsets:inset];
    
    [slider setMaximumTrackImage:maxTrack forState:UIControlStateNormal];
    [slider setMinimumTrackImage:minTrack forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"slider1-screen-bg.jpg"] drawInRect:self.view.bounds];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //viewA.transform = CGAffineTransformMakeRotation(-M_PI_2);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
