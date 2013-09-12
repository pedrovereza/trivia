//
//  LCRGameService.h
//  trivia
//
//  Created by Pedro Vereza on 9/12/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCRGame.h"

@interface LCRGameService : NSObject

-(id)initWithGame:(LCRGame*)aGame;

- (void)run;

@end
