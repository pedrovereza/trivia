#import "LCRGame.h"
#import "LCRPlayer.h"
#import "NSMutableArray+QueueAddition.h"
#import "LCRQuestionCategory.h"
#import "LCRQuestionRepository.h"
#import "LCRQuestionCategoryHelper.h"

@implementation LCRGame{
    NSMutableArray * players;
    int currentPlayer;
}

- (id)initWithIOService:(id<LCRIOServicing>)ioService andQuestionRepository:(id<LCRQuestionRepositoring>)questionRepository
{
    self = [self init];
    
    if (self != nil)
    {
        _ioService = ioService;
        _questionRepository = questionRepository;
    }
    
    [self createQuestions];
    
    return self;
}

- (id)initWithIOService:(id<LCRIOServicing>)ioService
{
    id<LCRQuestionRepositoring> questionRepository = [LCRQuestionRepository new];
    self = [self initWithIOService:ioService andQuestionRepository: questionRepository];
    
    return self;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {    
        players = [NSMutableArray new];
        currentPlayer = 0;
    }
    
    return self;
}

- (void)createQuestions
{
    for (int i = 0; i < 50; i++)
    {
        [self createQuestionForCategory:Pop andIndex: i];
        [self createQuestionForCategory:Science andIndex: i];
        [self createQuestionForCategory:Sports andIndex: i];
        [self createQuestionForCategory:Rock andIndex: i];        
    }
}

- (void)createQuestionForCategory:(LCRQuestionCategory)category andIndex:(int)index
{
    NSString* question = [NSString stringWithFormat:@"%@ Question %i", [LCRQuestionCategoryHelper textValueOf:category], index];
    
    [_questionRepository addQuestion:question forCategory:category];
}

- (void)addPlayerNamed:(NSString *)aPlayerName
{
    LCRPlayer* player = [LCRPlayer playerWithName:aPlayerName];
    
    [players addObject:player];
    
    [_ioService output:@"%@ was added as player number %li", aPlayerName, [players count]];
}

- (int)numberOfPlayers
{
    return (int)[players count];
}

- (void)roll:(int)aRoll
{
    LCRPlayer* player = [self getCurrentPlayer];
    [_ioService output:@"%@ is the current player", player];
    [_ioService output:@"Rolled a %d", aRoll];
    
    if (player.isInPenaltyBox)
    {
        if ([self isOdd:aRoll])
        {
            [player getOutOfPenaltyBox];
            
            [_ioService output:@"%@ is getting out of the pentaly box", player];
        }
        else
        {    
            [_ioService output:@"%@ is not getting out of the penalty box", player];
            return;
        }
    }
    
    [player movePositions:aRoll withLimitOf: 12];
    
    [_ioService output:@"%@'s new location is %d", player, player.currentPosition];
    
    [_ioService output:@"The category is %@", [LCRQuestionCategoryHelper textValueOf:[self currentCategory]]];
    
    [self askQuestion];
}

- (BOOL)isOdd:(int)aNumber
{
    return aNumber % 2 != 0;
}

- (void)askQuestion
{
    LCRQuestionCategory category = [self currentCategory];
    
    [_ioService output:@"%@", [_questionRepository getQuestionForCategory:category]];
}

- (LCRQuestionCategory)currentCategory
{
    LCRPlayer* player = [self getCurrentPlayer];
    
    if (player.currentPosition == 0) return Pop;
    if (player.currentPosition == 4) return Pop;
    if (player.currentPosition == 8) return Pop;
    if (player.currentPosition == 1) return Science;
    if (player.currentPosition == 5) return Science;
    if (player.currentPosition == 9) return Science;
    if (player.currentPosition == 2) return Sports;
    if (player.currentPosition == 6) return Sports;
    if (player.currentPosition == 10) return Sports;
    
    return Rock;
}

- (void)correctAnswer
{
    LCRPlayer* player = [self getCurrentPlayer];
    
    if (player.isInPenaltyBox)
    {
        [self moveToNextPlayer];
        
        return;
    }
    
    [_ioService output:@"Answer was correct!!!!"];
    [player addCoins:1];
    
    [_ioService output:@"%@ now has %d Gold Coins.",
          player, player.totalCoins];
    
    _hasAWinner = [self playerWon];
    
    [self moveToNextPlayer];
}

- (void)wrongAnswer
{
    LCRPlayer* player = players[currentPlayer];
    
    [_ioService output:@"Question was incorrectly answered"];
    [_ioService output:@"%@ was sent to the penalty box", player];
    
    [player goToPenaltyBox];
    
    [self moveToNextPlayer];
}

- (BOOL)playerWon
{
    return [[self getCurrentPlayer] totalCoins] == 6;
}

- (LCRPlayer*)getCurrentPlayer
{
    return players[currentPlayer];
}

- (void)moveToNextPlayer
{
    currentPlayer = (currentPlayer + 1) % [self numberOfPlayers];
}

@end