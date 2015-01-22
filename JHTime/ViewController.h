//
//  ViewController.h
//  JHTime
//
//  Created by 刘海 on 14/6/18.
//  Copyright (c) 2014年 Hai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CUSFlashLabel.h"
#import <AVFoundation/AVFoundation.h>
#import "Animation.h"

#define JHDate  @"2014-09-06"       //结婚日期

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer* player;
    
    NSArray* imageArray;
    
    int index;
    
    BOOL isopen;
}

@property(nonatomic,strong)IBOutlet CUSFlashLabel* dateLabel;
@property(nonatomic,strong)IBOutlet CUSFlashLabel* loveLabel;

@property(nonatomic,strong)IBOutlet UIImageView* bgimage;

-(IBAction)clickbtn:(UIButton*)btn;

@end
