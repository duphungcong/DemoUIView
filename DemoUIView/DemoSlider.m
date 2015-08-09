//
//  DemoSlider.m
//  ObjCExamples
//
//  Created by du phung cong on 8/9/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "DemoSlider.h"

@interface DemoSlider ()

//@property (weak, nonatomic) IBOutlet UISlider *slider;
{
    NSTimer* _timer;
    __weak IBOutlet UISlider *slider;
}

@end

@implementation DemoSlider
{
    /*NSTimer* _timer;
    __weak IBOutlet UISlider *slider;*/
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                              target:self
                                            selector:@selector(onTimer)
                                            userInfo:nil
                                             repeats:true];
    slider.transform = CGAffineTransformMakeRotation(-M_PI_2);
    slider.tintColor = [UIColor redColor];
    slider.thumbTintColor = [UIColor blueColor];

    /*self.slider.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.slider.tintColor = [UIColor redColor];
    self.slider.thumbTintColor = [UIColor blueColor];*/
}

- (void) onTimer {
    //NSLog(@"hi");
    /*self.slider.value += 0.05;
    if (self.slider.value >= 1.0) {
        self.slider.value = 1.0;
        [_timer invalidate];
    }*/
    slider.value += 0.05;
     if (slider.value >= 1.0) {
         slider.value = 1.0;
         [_timer invalidate];
     }
}
@end
