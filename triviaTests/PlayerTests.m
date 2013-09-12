//
//  PlayerTests.m
//  trivia
//
//  Created by Pedro Vereza on 9/3/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import "LCRPlayer.h"

@interface PlayerTests : SenTestCase

@end

@implementation PlayerTests

LCRPlayer *player;

- (void)setUp
{
    [super setUp];
    
    player = [[LCRPlayer new]retain];
}

- (void)tearDown
{
    [player release];
    
    [super tearDown];
}

- (void)test_Player_Has_Number_Of_Coins
{
    [player addCoins: 3];
    STAssertEquals(3, player.totalCoins, nil);
    
    [player addCoins: 4];
    STAssertEquals(7, player.totalCoins, nil);
}

- (void)test_Player_Has_Position
{
    [player movePositions: 3 withLimitOf:100];
    STAssertEquals(3, player.currentPosition, nil);
    
    [player movePositions: 4 withLimitOf:100];
    STAssertEquals(7, player.currentPosition, nil);
}

- (void)test_Player_Position_Can_Be_Limited
{
    [player movePositions: 3 withLimitOf:12];
    [player movePositions: 10 withLimitOf:12];
    
    STAssertEquals(1, player.currentPosition, nil);
}

- (void)test_Player_Can_Get_In_And_Out_Of_Penalty_Box
{
    [player goToPenaltyBox];
    STAssertTrue(player.isInPenaltyBox, nil);
    
    [player getOutOfPenaltyBox];
    STAssertFalse(player.isInPenaltyBox, nil);
}

- (void)test_Player_Is_Created_With_Name_Only
{
    LCRPlayer* newPlayer = [LCRPlayer playerWithName:@"Name"];
    
    STAssertEquals(@"Name", newPlayer.name, nil);
    STAssertEquals(0, newPlayer.totalCoins, nil);
    STAssertEquals(0, newPlayer.currentPosition, nil);
    STAssertEquals(NO, newPlayer.isInPenaltyBox, nil);
    
}

@end
