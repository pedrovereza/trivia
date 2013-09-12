#import "LCRGame.h"
#import "FakeIOService.h"


@interface triviaTests : SenTestCase

@end

@implementation triviaTests

LCRGame* game;
int numberOfPlayers = 1;
NSMutableArray* expectedOutputHistory;
FakeIOService* fakeIoService;


- (void)setUp
{
    [super setUp];
    
    fakeIoService = [FakeIOService new];
    game = [[[LCRGame alloc] initWithIOService:fakeIoService] retain];
    expectedOutputHistory = [[NSMutableArray new]retain];
    
    for (int i = 0; i < numberOfPlayers; i++)
    {
        [game addPlayerNamed: [NSString stringWithFormat:@"Player %i", i]];
        [expectedOutputHistory addObject:[NSString stringWithFormat:
                                          @"Player %i was added as player number %i",i, i + 1]];
        
    }
}

- (void)tearDown
{
    [game release];
    [expectedOutputHistory release];
    
    [super tearDown];
}

- (void)test_Player_Is_Sent_To_Penalty_Box_When_Answer_Is_Incorrect
{
    [expectedOutputHistory addObject:@"Player 0 is the current player"];
    [expectedOutputHistory addObject:@"Rolled a 4"];
    [expectedOutputHistory addObject:@"Player 0's new location is 4"];
    [expectedOutputHistory addObject:@"The category is Pop"];
    [expectedOutputHistory addObject:@"Pop Question 0"];
    [expectedOutputHistory addObject:@"Question was incorrectly answered"];
    [expectedOutputHistory addObject:@"Player 0 was sent to the penalty box"];
    
    [game roll: 4];
    [game wrongAnswer];
    
    STAssertEqualObjects(expectedOutputHistory, fakeIoService.outputHistory, nil);
}

- (void)test_Player_Gets_Out_Of_Penalty_Box_If_An_Odd_Number_Is_Rolled_And_Answer_Is_Correct
{
    [expectedOutputHistory addObject:@"Player 0 is the current player"];
    [expectedOutputHistory addObject:@"Rolled a 4"];
    [expectedOutputHistory addObject:@"Player 0's new location is 4"];
    [expectedOutputHistory addObject:@"The category is Pop"];
    [expectedOutputHistory addObject:@"Pop Question 0"];
    [expectedOutputHistory addObject:@"Question was incorrectly answered"];
    [expectedOutputHistory addObject:@"Player 0 was sent to the penalty box"];
    [expectedOutputHistory addObject:@"Player 0 is the current player"];
    [expectedOutputHistory addObject:@"Rolled a 4"];
    [expectedOutputHistory addObject:@"Player 0 is not getting out of the penalty box"];
    [expectedOutputHistory addObject:@"Player 0 is the current player"];
    [expectedOutputHistory addObject:@"Rolled a 3"];
    [expectedOutputHistory addObject:@"Player 0 is getting out of the pentaly box"];
    [expectedOutputHistory addObject:@"Player 0's new location is 7"];
    [expectedOutputHistory addObject:@"The category is Rock"];
    [expectedOutputHistory addObject:@"Rock Question 0"];
    [expectedOutputHistory addObject:@"Question was incorrectly answered"];
    [expectedOutputHistory addObject:@"Player 0 was sent to the penalty box"];

    [game roll: 4];
    [game wrongAnswer];
    [game roll: 4];
    [game roll: 3];
    [game wrongAnswer];
    
    STAssertEqualObjects(expectedOutputHistory, fakeIoService.outputHistory, nil);
}

- (void)test_Player_Wins_With_Six_Coins
{
    [self allPlayersAnsweredCorrectlyTimes:6];
    
    STAssertTrue(game.hasAWinner, @"Game should have finished after 6 correct answers");
}

- (void)allPlayersAnsweredCorrectlyTimes: (int)times
{
    for (int i = 0; i < times * numberOfPlayers; i++)
    {
        [game roll: 3];
        [game correctAnswer];
    }
}

@end
