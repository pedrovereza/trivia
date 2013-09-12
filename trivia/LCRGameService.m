//
//  LCRGameService.m
//  trivia
//
//  Created by Pedro Vereza on 9/12/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRGameService.h"


@implementation LCRGameService

LCRGame* game;

-(id)initWithGame:(LCRGame *)aGame
{
    self = [super init];
    
    if (self != nil)
    {
        game = aGame;
    }
    
    return self;
}

- (void)run
{
    do {
        
        [game roll:(rand() % 5) + 1];
        
        if ((rand() % 9) == 7) {
            [game wrongAnswer];
        } else {
            [game correctAnswer];
        }
        
        
    } while (!game.hasAWinner);
}

@end
