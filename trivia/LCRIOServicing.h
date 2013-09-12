//
//  LCRIOServicing.h
//  trivia
//
//  Created by Pedro Vereza on 9/6/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LCRIOServicing <NSObject>

- (void)output:(NSString*)format, ...;

@end
