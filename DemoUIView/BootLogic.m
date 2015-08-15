//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Demo UISlider", CLASS: @"DemoSlider"},
                                    @{TITLE: @"Slider 1", CLASS: @"BackgroundSlider"},
                                    @{TITLE: @"Slider 2", CLASS: @"CaptionSlider"},
                                    @{TITLE: @"Slider 3", CLASS: @"UISliderThree"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Array", CLASS: @"InterB"},
                                    @{TITLE: @"Dictionary", CLASS: @"InterB"}
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"Object-C by Examples";
    mainScreen.about = @"This is demo of Object-C language";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
