//
//  LCRPlayer.m
//  trivia
//
//  Created by Pedro Vereza on 9/3/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRPlayer.h"

@implementation LCRPlayer

+ (id)playerWithName:(NSString*)name
{
    return [[self alloc] initWithName:name];
}

- (id)initWithName:(NSString*)name{
    self = [super init];
    
    if (self != nil)
        _name = name;
    
    return self;
}

- (void)goToPenaltyBox
{
    _inPenaltyBox = YES;
}

- (void)getOutOfPenaltyBox
{
    _inPenaltyBox = NO;
}

- (void)addCoins:(int)coins
{
    _totalCoins += coins;
}

- (void)movePositions:(int)positionsToMove withLimitOf:(int)limit
{
    _currentPosition = (_currentPosition + positionsToMove) % limit;
}

- (NSString*)description
{
    return self.name;
}

@end
