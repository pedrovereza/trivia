//
//  LCRPlayer.h
//  trivia
//
//  Created by Pedro Vereza on 9/3/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCRPlayer : NSObject

@property (readonly) NSString *name;
@property (readonly, getter = isInPenaltyBox) BOOL inPenaltyBox;
@property (readonly) int currentPosition;
@property (readonly) int totalCoins;


+ (id)playerWithName:(NSString*)name;

- (void)addCoins:(int)coins;
- (void)movePositions:(int)positionsToMove withLimitOf:(int)limit;
- (void)goToPenaltyBox;
- (void)getOutOfPenaltyBox;

@end
