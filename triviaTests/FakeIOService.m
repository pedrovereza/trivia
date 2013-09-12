//
//  FakeIOService.m
//  trivia
//
//  Created by Pedro Vereza on 9/6/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "FakeIOService.h"

@implementation FakeIOService

- (id)init
{
    self = [super init];
    
    if (self != nil)
        _outputHistory = [NSMutableArray new];
    
    return self;
}

- (void)output:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
    [_outputHistory addObject: [[NSString alloc] initWithFormat:format arguments: args]];
    va_end(args);;
}

@end
