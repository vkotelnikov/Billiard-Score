//
//  GameData.h
//  Billiard Score
//
//  Created by Vyacheslav Kotelnikov on 07.03.16.
//  Copyright © 2016 Vyacheslav Kotelnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject
@property int highscore;
+(id)data;
-(void)save;
-(void)load;

@end
