//
//  GameData2.m
//  Billiard Score
//
//  Created by Vyacheslav Kotelnikov on 07.03.16.
//  Copyright © 2016 Vyacheslav Kotelnikov. All rights reserved.
//

#import "GameData2.h"

@interface GameData2 ()
@property NSString *filePath;
@end

@implementation GameData2

+(id)data{
    
    GameData2 *data = [[GameData2 alloc] init];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
    NSString *fileName = @"archive2.data";
    data.filePath = [path stringByAppendingPathComponent:fileName];
    return data;
}

-(void)save{
    NSNumber *highscoreObject = [NSNumber numberWithInt:self.highscore];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:highscoreObject];
    [data writeToFile:self.filePath atomically:YES];
}

-(void)load{
    NSData *data = [NSData dataWithContentsOfFile:self.filePath];
    NSNumber *highscoreObject = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.highscore = highscoreObject.intValue;
}

@end