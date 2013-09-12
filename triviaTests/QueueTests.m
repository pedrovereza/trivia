//
//  QueueTests.m
//  trivia
//
//  Created by Pedro Vereza on 9/5/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "NSMutableArray+QueueAddition.h"

@interface QueueTests : SenTestCase

@end

@implementation QueueTests

NSMutableArray* array;

- (void)setUp
{
    [super setUp];
    
    array = [[NSMutableArray alloc] init];
}

- (void)tearDown
{
    [array release];
    
    [super tearDown];
}

- (void)test_Should_Dequeue_Elements_In_The_Same_Order_They_Were_Enqueued
{
    [array enqueue:@"first"];
    [array enqueue:@"second"];
    [array enqueue:@"third"];
    
    STAssertEquals(@"first", [array dequeue], nil);
    STAssertEquals(@"second", [array dequeue], nil);
    STAssertEquals(@"third", [array dequeue], nil);
    
    STAssertTrue([array count] == 0, nil);
}

- (void)test_Dequeue_Should_Return_Nil_When_Queue_Is_Empty
{
    STAssertTrue([array count] == 0, nil);
    STAssertNil([array dequeue], nil);

}


@end
