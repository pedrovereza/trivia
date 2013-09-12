#include "LCRGame.h"
#import "LCRIOService.h"
#import "LCRQuestionRepository.h"
#import "LCRGameService.h"

int main(int argc, const char * argv[])
{
    srand ( (int)time(NULL) );
    
    @autoreleasepool {
        
        id<LCRIOServicing> ioService = [LCRIOService new];
        id<LCRQuestionRepositoring> questionRepository = [LCRQuestionRepository new];
        LCRGame *aGame = [[LCRGame alloc] initWithIOService:ioService andQuestionRepository:questionRepository];
        
        [aGame addPlayerNamed:@"Chet"];
        [aGame addPlayerNamed:@"Pat"];
        [aGame addPlayerNamed:@"Sue"];
        
		LCRGameService* gameService = [[LCRGameService alloc]initWithGame:aGame];
        
        [gameService run];
        
    }
    return 0;
}

