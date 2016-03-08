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
@synthesize timerSwitchLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    running = FALSE;
    startDate = [NSDate date];
    GameData *data = [GameData data];
    [data load];
    self.frame.text = [NSString stringWithFormat:@"%d", data.highscore];
    
    GameData2 *data2 = [GameData2 data];
    [data2 load];
    self.frame2.text = [NSString stringWithFormat:@"%d", data2.highscore];
    
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
        if (running){
        [self resetTimer];
        }
        score = 0;
        self.frame.text = [NSString stringWithFormat:@"%d", frame+1];
        GameData *data = [GameData data];
        data.highscore = frame+1;
        [data save];
    }
    self.score.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)DecreaseScore:(id)sender {
    int score = [self.score.text intValue];
    int frame = [self.frame.text intValue];
    if(frame){
    score--;
        if (score < 0) {
            if (running) {
                [self resetTimer];
            }
            score = 0;
            self.frame.text = [NSString stringWithFormat:@"%d", frame-1];
            GameData *data = [GameData data];
            data.highscore = frame-1;
            [data save];
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
        if (running){
        [self resetTimer];
        }
        score = 0;
        self.frame2.text = [NSString stringWithFormat:@"%d", frame+1];
        GameData2 *data = [GameData2 data];
        data.highscore = frame+1;
        [data save];
    }
    self.score2.text = [NSString stringWithFormat:@"%d", score];
}

- (IBAction)DecreaseScore2:(id)sender {
    int score = [self.score2.text intValue];
    int frame = [self.frame2.text intValue];
    if (frame) {
        score--;
        if (score < 0) {
            if(running){
            [self resetTimer];
            }
            score = 0;
            self.frame2.text = [NSString stringWithFormat:@"%d", frame-1];
            GameData2 *data = [GameData2 data];
            data.highscore = frame+1;
            [data save];
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
        [sender setTitle:@"Сброс" forState:UIControlStateNormal];
        startDate = [NSDate date];
        if (stopTimer == nil) {
            stopTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        }
    } else {
        running = FALSE;
        [sender setTitle:@"Начать" forState:UIControlStateNormal];
        pauseDate = [NSDate date];
        [stopTimer invalidate];
        stopTimer = nil;
    }
}

- (IBAction)pause:(id)sender {
    if (running) {
        [self pauseTimer];
        [timerSwitchLabel setTitle:@"Начать" forState:UIControlStateNormal];
        stopTimer = nil;
    } else {
        running = TRUE;
        NSDate *currentDate = [NSDate date];
        NSTimeInterval pauseInterval = [currentDate timeIntervalSinceDate:pauseDate];
        startDate = [NSDate dateWithTimeInterval:pauseInterval sinceDate:startDate];
        stopTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    }
}

-(void) updateTimer{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    timerLabel.text = timeString;
}

-(void)resetTimer{
    [stopTimer invalidate];
    stopTimer = nil;
    timerLabel.text = @"00:00:00";
    [self TimerSwitch:timerSwitchLabel];
    running = FALSE;
}

-(void)pauseTimer{
    pauseDate = [NSDate date];
    [stopTimer invalidate];
    running = FALSE;
}
@end
