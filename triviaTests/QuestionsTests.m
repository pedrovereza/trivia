//
//  QuestionsTests.m
//  trivia
//
//  Created by Pedro Vereza on 9/9/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRQuestionRepository.h"
#import "LCRQuestionCategory.h"

@interface QuestionsTests : SenTestCase

@end

@implementation QuestionsTests

LCRQuestionRepository* questionRepository;

- (void)setUp
{
    [super setUp];
    
    questionRepository = [[LCRQuestionRepository new]retain];
}

- (void)tearDown
{
    [questionRepository release];
    
    [super tearDown];
}

- (void)test_Question_Repository_Behaves_As_A_Queue
{
    [questionRepository addQuestion:@"First question" forCategory:Sports];
    [questionRepository addQuestion:@"Second question" forCategory:Sports];
    [questionRepository addQuestion:@"Third question" forCategory:Sports];
    
    NSString* aQuestion = [questionRepository getQuestionForCategory:Sports];
    
    STAssertEquals(aQuestion, @"First question", nil);
}

- (void)test_Question_With_Different_Category_Belong_To_Different_Queues
{
    [questionRepository addQuestion:@"First question to One Category" forCategory:Sports];
    [questionRepository addQuestion:@"First question to Other Category" forCategory:Rock];
    
    NSString* aQuestionForOtherCategory = [questionRepository getQuestionForCategory:Rock];
    NSString* aQuestionForOneCategory = [questionRepository getQuestionForCategory:Sports];
    
    STAssertEquals(aQuestionForOtherCategory, @"First question to Other Category", nil);
    STAssertEquals(aQuestionForOneCategory, @"First question to One Category", nil);
}

@end
