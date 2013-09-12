//
//  NSMutableArray+Stack.h
//  trivia
//
//  Created by Pedro Vereza on 9/5/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (QueueAddition)

- (id)dequeue;
- (void) enqueue:(id)obj;

@end
