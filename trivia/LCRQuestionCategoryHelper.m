//
//  LCRQuestionCategoryHelper.m
//  trivia
//
//  Created by Pedro Vereza on 9/10/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRQuestionCategoryHelper.h"

@implementation LCRQuestionCategoryHelper

+ (NSString*)textValueOf:(LCRQuestionCategory)aCategory
{
    switch (aCategory) {
        case Sports:
            return @"Sports";
            
        case Science:
            return @"Science";
            
        case Rock:
            return @"Rock";
            
        case Pop:
            return @"Pop";
    }
}

@end

