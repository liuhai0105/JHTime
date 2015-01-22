//
//  ViewController.m
//  JHTime
//
//  Created by 刘海 on 14/6/18.
//  Copyright (c) 2014年 Hai. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize dateLabel;
@synthesize loveLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    imageArray = @[@"love_1.jpg",@"love_2.jpg",@"love_3.jpg",@"love_4.jpg",@"love_5.jpg",@"love_6.jpg",@"love_7.jpg",@"love_8.jpg"];
    
    
    index = (arc4random() % 8);
    
    [self.bgimage setImage:[UIImage imageNamed:[imageArray objectAtIndex:index]]];
    
    [self.dateLabel setSpotlightColor:[UIColor whiteColor]];
    [self.dateLabel setContentMode:UIViewContentModeCenter];
    [self.dateLabel startAnimating];
    
    [self.loveLabel setSpotlightColor:[UIColor whiteColor]];
    [self.loveLabel setContentMode:UIViewContentModeCenter];
    [self.loveLabel startAnimating];
    
    NSString *soundPath=[[NSBundle mainBundle] pathForResource:@"audio" ofType:@"mp3"];
    
   
    if (soundPath) {
        NSURL *soundUrl=[[NSURL alloc] initFileURLWithPath:soundPath];
        player=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        player.delegate = self;
        [player prepareToPlay];
        player.numberOfLoops = -1;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
    
    isopen = NO;
}

-(void)refresh:(NSTimer*)timer
{
    int tempindex = (arc4random() % 8);
    
    BOOL result = YES;
    
    while (result) {
        if (tempindex == index) {
            tempindex = (arc4random() % 8);
        }else{
            index = tempindex;
            result = NO;
        }
    }
    
    int animationIndex = (arc4random() % 10);
    int subtypeIndex = (arc4random() % 4);
//    
//    NSLog(@"index = %d",index);
//    NSLog(@"animationIndex = %d",animationIndex);
//    NSLog(@"subtypeIndex = %d",subtypeIndex);
    
    CATransition* animation = [CATransition animation];
    [animation setDuration:3];
    [animation setType:[Animation AnimationIndex:animationIndex]];
    [animation setSubtype:[Animation AnimationSubtype:subtypeIndex]];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.bgimage.layer addAnimation:animation forKey:nil];
    
    [self.bgimage setImage:[UIImage imageNamed:[imageArray objectAtIndex:index]]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![player isPlaying]) {
        [player play];
    }
    
    //计算剩余时间
    NSDate* nowdate = [NSDate date];        //当前日期
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd";
    NSTimeZone* timeZone = [NSTimeZone defaultTimeZone];
    [df setTimeZone:timeZone];
    NSDate* jhdate = [df dateFromString:JHDate];
    
    NSString* nowdatestr = [df stringFromDate:nowdate];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSDayCalendarUnit|NSHourCalendarUnit
                                               fromDate:nowdate toDate:jhdate options:0];
    NSInteger day = [components day];
    
//    NSLog(@"day = %d",day);
    
    
    //+1为计算结婚当天
    self.dateLabel.text = [NSString stringWithFormat:@"结婚第:%d天",(int)(-day)+1];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
}

-(IBAction)clickbtn:(UIButton*)btn
{
    if (!isopen) {
        isopen = YES;
        
        CATransition* animation2 = [CATransition animation];
        [animation2 setDuration:4];
        [animation2 setType:@"rippleEffect"];
        [animation2 setSubtype:kCATransitionFromTop];
        [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
        self.loveLabel.alpha = 1;
        [self.loveLabel.layer addAnimation:animation2 forKey:nil];
        NSLog(@"open");
        
    }else
    {
        isopen = NO;
        
        CATransition* animation2 = [CATransition animation];
        [animation2 setDuration:4];
        [animation2 setType:@"rippleEffect"];
        [animation2 setSubtype:kCATransitionFromLeft];
        [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        self.loveLabel.alpha = 0;
        [self.loveLabel.layer addAnimation:animation2 forKey:nil];
         NSLog(@"close");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
