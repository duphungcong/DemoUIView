//
//  Switch.m
//  DemoUIView
//
//  Created by du phung cong on 8/25/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "Switch.h"
#import "CustomSwitch.h"
@interface Switch ()

@end

@implementation Switch
{
    CustomSwitch *mySwitch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    mySwitch = [[CustomSwitch alloc] initWithFrame:CGRectMake(0, 0, 104, 46)];
    mySwitch.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.4);
    [self.view addSubview:mySwitch];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
