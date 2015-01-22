//
//  Animation.m
//  ggg
//
//  Created by Hai L on 11-12-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Animation.h"
#import <QuartzCore/QuartzCore.h>

@implementation Animation


+(NSString*)AnimationIndex:(int)index
{
    
    NSString* string = [[NSString alloc]init];
    switch (index) {
        case 0:
            string = kCATransitionFade;
            break;
        case 1:
            string = kCATransitionPush;
            break;
        case 2:
            string = kCATransitionReveal;
            break;
        case 3:
            string = kCATransitionMoveIn;
            break;
        case 4:
            string = @"cube";
            break;
        case 5:
            string = @"suckEffect";
            break;
        case 6:
            string = @"oglFlip";
            break;
        case 7:
            string = @"rippleEffect";
            break;
        case 8:
            string = @"pageCurl";
            break;
        case 9:
            string = @"pageUnCurl";
            break;
        
    }
    
    return string;
}


/**
 CA_EXTERN NSString * const kCATransitionFromRight
 __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
 CA_EXTERN NSString * const kCATransitionFromLeft
 __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
 CA_EXTERN NSString * const kCATransitionFromTop
 __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
 CA_EXTERN NSString * const kCATransitionFromBottom
 **/

+(NSString*)AnimationSubtype:(int)index
{
    NSString* string = kCATransitionFromRight;
    switch (index) {
        case 0:
            string = kCATransitionFromRight;
            break;
        case 1:
            string = kCATransitionFromLeft;
            break;
        case 2:
            string = kCATransitionFromTop;
            break;
        case 3:
            string = kCATransitionFromBottom;
            break;
    }
    return string;
}

@end
