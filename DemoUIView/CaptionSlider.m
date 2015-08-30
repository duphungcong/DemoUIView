//
//  CaptionSlider.m
//  DemoUIView
//
//  Created by du phung cong on 8/18/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//
//  Thanks to http://www.getappninja.com/blog/how-to-make-a-custom-uislider

#import "CaptionSlider.h"

@implementation CaptionSlider
{
    //NSAttributedString* attrString;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self constructSlider];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self constructSlider];
    }
    return self;
}

-(id)init {
    self = [super init];
    if (self) {
        [self constructSlider];
    }
    return self;
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchPoint = [touch locationInView:self];
    // Check if the thumb is touched. If so, draw the thumb value
    if(CGRectContainsPoint(CGRectInset([self getThumbRect], -12.0, -12.0), touchPoint)) {
        [self drawThumbValue];
    }
    
    return [super beginTrackingWithTouch:touch withEvent:event];
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // Update the thumb value as slider thumb is being moved
    [self drawThumbValue];
    return [super continueTrackingWithTouch:touch withEvent:event];
}

-(void)cancelTrackingWithEvent:(UIEvent *)event {
    return [super cancelTrackingWithEvent:event];
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self drawThumbValue];
    return [super endTrackingWithTouch:touch withEvent:event];
}

- (void)constructSlider {
    // set min, max value
    [self setMinimumValue:0.0];
    [self setMaximumValue:20.0];
    
    // set thumb image
    [self setThumbImage:[UIImage imageNamed:@"slider2-thumb.png"] forState:UIControlStateNormal];
    
    // set track image
    UIEdgeInsets insetMinTrack = UIEdgeInsetsMake(0, 10, 0, 0);
    UIEdgeInsets insetMaxTrack = UIEdgeInsetsMake(0, 0, 0, 10);
    UIImage* maxtrack = [[UIImage imageNamed:@"slider2-maxtrack.png"] resizableImageWithCapInsets:insetMaxTrack];
    UIImage* mintrack = [[UIImage imageNamed:@"slider2-mintrack.png"] resizableImageWithCapInsets:insetMinTrack];
    [self setMaximumTrackImage:maxtrack forState:UIControlStateNormal];
    [self setMinimumTrackImage:mintrack forState:UIControlStateNormal];
    
    
    // init draw the thumb value
    CGRect thumbRect = [self getThumbRect];
    CGSize thumbValueSize = CGSizeMake(52.0, 36.0);
    self.thumbValue = [[UIView alloc] initWithFrame:CGRectMake(thumbRect.origin.x - (thumbValueSize.width / 2.0 - thumbRect.size.width / 2.0), thumbRect.origin.y - 40.0, thumbValueSize.width, thumbValueSize.height)];
    self.thumbValue.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"slider2-thumb-value-bg.png"]];

    [self addSubview:self.thumbValue];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(3.0, 6.0, 45.0, 20.0)];
    [self.thumbValue addSubview:label];

    label.attributedText = [self showTimeWithStyle:self.value];
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 1;
    
    // set remain time run
    CGRect rect = self.bounds;
    self.remainRunValue = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width + 5, rect.origin.y, 40.0, 20.0)];
    [self addSubview:self.remainRunValue];
    
    UILabel* remainTimeRunLabel = [[UILabel alloc] initWithFrame:CGRectMake(3.0, 5.0, 38.0, 18.0)];
    [self.remainRunValue addSubview:remainTimeRunLabel];
    
    remainTimeRunLabel.attributedText = [self showTimeWithStyle:self.maximumValue - self.value];
    remainTimeRunLabel.textAlignment = NSTextAlignmentCenter;
    remainTimeRunLabel.tag = 2;
    
    
}

- (void)drawThumbValue {
    CGRect thumbRect = [self getThumbRect];
    CGRect thumbValueRect = _thumbValue.frame;
    thumbValueRect.origin.x = thumbRect.origin.x - (_thumbValue.bounds.size.width / 2.0 - thumbRect.size.width / 2.0);
    self.thumbValue.frame = thumbValueRect;
    
    // update thumb value
    UIView* view = [self.thumbValue viewWithTag:1];
    if(view && [view isMemberOfClass:[UILabel class]]) {
        UILabel* label = (UILabel*) view;
        label.attributedText = [self showTimeWithStyle:self.value];
    }
    
    // update remain run value
    UIView* view1 = [self.remainRunValue viewWithTag:2];
    if(view1 && [view1 isMemberOfClass:[UILabel class]]) {
        UILabel* label1 = (UILabel*) view1;
        label1.attributedText = [self showTimeWithStyle:self.maximumValue - self.value];
    }
    
}

- (CGRect)getThumbRect {
    CGRect trackRect = [self trackRectForBounds:self.bounds];
    CGRect thumbRect = [self thumbRectForBounds:self.bounds trackRect:trackRect value:self.value];
    return thumbRect;
}

- (CGRect)getTrackRect {
    return [self trackRectForBounds:self.bounds];
}

- (NSString*)convertFloatToTime:(float)number {
    int minute;
    float second;
    minute = (int)(number);
    second = (float)((number - minute) * 60);
    return [NSString stringWithFormat:@"%02d:%02.0f", minute, second];
}

- (NSAttributedString*)showTimeWithStyle:(float)value {
    UIFont* font = [UIFont boldSystemFontOfSize:14.0f];
    UIColor* textColor = [UIColor colorWithRed:0x0D/255.0f
                                         green:0x0D/255.0f
                                         //green:0x4D/255.0f
                                          blue:0x72/255.0f
                                         alpha:1];
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : textColor,
                             NSFontAttributeName : font,
                             //NSTextEffectAttributeName : NSTextEffectLetterpressStyle, // Poor performance when active Letter press style -> why ???
                             };
    
    NSString* stringTime = [self convertFloatToTime:value];
    
    NSAttributedString* attrString = [[NSAttributedString alloc]
                                      initWithString:stringTime
                                      attributes:attrs];
    return attrString;
}

@end
