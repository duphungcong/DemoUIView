//
//  Slider2.m
//  DemoUIView
//
//  Created by du phung cong on 8/23/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "Slider2.h"

@interface Slider2 ()

@end

@implementation Slider2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CaptionSlider* slider = [[CaptionSlider alloc] initWithFrame:CGRectMake(60.0, 330.0, 250.0, 30)];
    [self. view addSubview:slider];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"slider2-screen-bg.jpg"] drawInRect:self.view.bounds];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
