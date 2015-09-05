//
//  CustomSwitch.m
//  DemoUIView
//
//  Created by du phung cong on 9/5/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "CustomSwitch.h"

@implementation CustomSwitch
{
    UIButton *_buttonOn;
    UIButton *_buttonOff;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 104, 46)];
    _buttonOff = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 46)];
    _buttonOn = [[UIButton alloc] initWithFrame:CGRectMake(52, 0, 52, 46)];
    
    [_buttonOff addTarget:self
                   action:@selector(pressOff)
         forControlEvents:UIControlEventTouchUpInside];
    
    [_buttonOn addTarget:self
                  action:@selector(pressOn)
        forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonOff];
    [self addSubview:_buttonOn];
    
    self.value = false;
    
    return self;
}

- (void) pressOff {
    self.value = false;
}

- (void) pressOn {
    self.value = true;
}

// getter function of property value
- (BOOL) getValue {
    return _value;
}

// setter function of property value
- (void) setValue:(BOOL)value {
    _value = value;
    if(_value) {
        [_buttonOff setImage:[UIImage imageNamed:@"OffOff.png"] forState:UIControlStateNormal];
        [_buttonOn setImage:[UIImage imageNamed:@"OnOn.png"] forState:UIControlStateNormal];
    }
    else {
        [_buttonOff setImage:[UIImage imageNamed:@"OnOff.png"] forState:UIControlStateNormal];
        [_buttonOn setImage:[UIImage imageNamed:@"OffOn.png"] forState:UIControlStateNormal];
    }
    
    NSLog(@"Value of switch %d", _value);
}
@end
