//
//  QuestionCategoryHelperTests.m
//  trivia
//
//  Created by Pedro Vereza on 9/10/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "LCRQuestionCategoryHelper.h"


@interface QuestionCategoryHelperTests : SenTestCase

@end

@implementation QuestionCategoryHelperTests

- (void)test_Converts_Enum_Value_To_Text
{
    STAssertEquals(@"Pop", [LCRQuestionCategoryHelper textValueOf:Pop], nil);
    STAssertEquals(@"Sports", [LCRQuestionCategoryHelper textValueOf:Sports], nil);
    STAssertEquals(@"Science", [LCRQuestionCategoryHelper textValueOf:Science], nil);
    STAssertEquals(@"Rock", [LCRQuestionCategoryHelper textValueOf:Rock], nil);
}


@end
