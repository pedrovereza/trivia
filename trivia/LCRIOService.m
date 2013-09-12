//
//  LCRIOService.m
//  trivia
//
//  Created by Pedro Vereza on 9/6/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRIOService.h"

@implementation LCRIOService

- (void)output:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
    NSLogv(format, args);
    va_end(args);;
}

@end
