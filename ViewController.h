//
//  ViewController.h
//  Billiard Score
//
//  Created by Vyacheslav Kotelnikov on 04.03.16.
//  Copyright © 2016 Vyacheslav Kotelnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameData.h"
#import "GameData2.h"

@interface ViewController : UIViewController
{
    NSTimer *stopTimer;
    NSDate *startDate;
    BOOL running;
}
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UILabel *frame;
@property (weak, nonatomic) IBOutlet UILabel *frame2;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *timerSwitchLabel;

- (IBAction)IncreaseScore:(id)sender;
- (IBAction)DecreaseScore:(id)sender;
- (IBAction)IncreaseScore2:(id)sender;
- (IBAction)DecreaseScore2:(id)sender;
- (IBAction)TimerSwitch:(id)sender;

-(void)updateTimer;
-(void)resetTimer;


@end

