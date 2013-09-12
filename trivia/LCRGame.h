#import "LCRIOServicing.h"
#import "LCRQuestionRepositoring.h"

@interface LCRGame : NSObject

@property (readonly) id <LCRIOServicing> ioService;
@property (readonly) id <LCRQuestionRepositoring> questionRepository;
@property (readonly) BOOL hasAWinner;

-(id)initWithIOService:(id <LCRIOServicing>) ioService andQuestionRepository:(id <LCRQuestionRepositoring>)questionRepository;
-(id)initWithIOService:(id <LCRIOServicing>) ioService;

-(void)roll:(int)aRoll;
-(void)correctAnswer;
-(void)wrongAnswer;
-(void)addPlayerNamed:(NSString *)aPlayerName;

@end
