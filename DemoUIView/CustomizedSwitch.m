//
//  CustomizedSwitch.m
//  DemoUIView
//
//  Created by du phung cong on 8/25/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "CustomizedSwitch.h"

@implementation CustomizedSwitch

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self constructSwitch];
    }
    
    return self;
}

-(void)constructSwitch {
    float buttonWidth = self.bounds.size.width / 2.0;
    float buttonHeight = self.bounds.size.height;
    
    self.onButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, buttonWidth, buttonHeight)];
    //self.onButton.backgroundColor = [UIColor greenColor];
    self.offButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.origin.x + buttonWidth, 0.0, buttonWidth, buttonHeight)];
    self.offButton.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.onButton];
    [self addSubview:self.offButton];
    
    [self.onButton setTitle:@"ON" forState:UIControlStateNormal];
}
@end
