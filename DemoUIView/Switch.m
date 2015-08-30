//
//  Switch.m
//  DemoUIView
//
//  Created by du phung cong on 8/25/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "Switch.h"

@interface Switch ()

@end

@implementation Switch

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CustomizedSwitch* customizedSwitch = [[CustomizedSwitch alloc] initWithFrame:CGRectMake(30.0, 250.0, 125.0, 49.0)];
    [self.view addSubview:customizedSwitch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
