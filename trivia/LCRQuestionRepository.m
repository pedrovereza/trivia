//
//  LCRQuestionRepository.m
//  trivia
//
//  Created by Pedro Vereza on 9/10/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRQuestionRepository.h"
#import "NSMutableArray+QueueAddition.h"

@implementation LCRQuestionRepository

NSMutableArray *popQuestions;
NSMutableArray *scienceQuestions;
NSMutableArray *sportsQuestions;
NSMutableArray *rockQuestions;


- (id)init
{
    self  = [super init];
    
    if (self != nil)
    {
        popQuestions = [[NSMutableArray alloc] init];
        scienceQuestions = [[NSMutableArray alloc] init];
        sportsQuestions = [[NSMutableArray alloc] init];
        rockQuestions = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addQuestion:(NSString *)aQuestion forCategory:(LCRQuestionCategory)aCategory
{

    NSMutableArray* questions = [self getQuestionsForCategory:aCategory];
    
    [questions enqueue: aQuestion];
}

- (NSString*)getQuestionForCategory:(LCRQuestionCategory)aCategory
{
    NSMutableArray* questions = [self getQuestionsForCategory:aCategory];
    
    return [questions dequeue];
}

- (NSMutableArray*)getQuestionsForCategory:(LCRQuestionCategory)aCategory
{
    switch(aCategory)
    {
        case Sports:
            return sportsQuestions;
            
        case Rock:
            return rockQuestions;
            
        case Science:
            return scienceQuestions;
            
        case Pop:
            return popQuestions;
    }
}

@end
