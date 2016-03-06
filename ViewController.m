//
//  ViewController.m
//  Billiard Score
//
//  Created by Vyacheslav Kotelnikov on 04.03.16.
//  Copyright © 2016 Vyacheslav Kotelnikov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController
@synthesize timerLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    timerLabel.text = @"00.00";
    running = FALSE;
    startDate = [NSDate date];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IncreaseScore:(id)sender {
    int score = [self.score.text intValue];
    int frame = [self.frame.text intValue];
    score++;
    if (score > 7) {
        score = 0;
        self.frame.text = [NSString stringWithFormat:@"%d", frame+1];
    }
    self.score.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)DecreaseScore:(id)sender {
    int score = [self.score.text intValue];
    int frame = [self.frame.text intValue];
    if(frame){
    score--;
        if (score < 0) {
            score = 0;
            self.frame.text = [NSString stringWithFormat:@"%d", frame-1];
        }
    } else {
        score--;
        if (score < 0) {
            score = 0;
        }
    }
    self.score.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)IncreaseScore2:(id)sender {
    int score = [self.score2.text intValue];
    int frame = [self.frame2.text intValue];
    score++;
    if (score > 7) {
        score = 0;
        self.frame2.text = [NSString stringWithFormat:@"%d", frame+1];
    }
    self.score2.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)DecreaseScore2:(id)sender {
    int score = [self.score2.text intValue];
    int frame = [self.frame2.text intValue];
    if (frame) {
    score--;
        if (score < 0) {
            score = 0;
            self.frame2.text = [NSString stringWithFormat:@"%d", frame-1];
        }
    } else {
        score--;
        if (score < 0) {
            score = 0;
        }
    }
    self.score2.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)TimerSwitch:(id)sender {
    if (!running) {
        running = TRUE;
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        if (stopTimer==nil) {
            stopTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        }
    } else {
        running = FALSE;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        [stopTimer invalidate];
        stopTimer = nil;
    }
}

-(void) updateTimer{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    timerLabel.text = timeString;
    
}
@end
