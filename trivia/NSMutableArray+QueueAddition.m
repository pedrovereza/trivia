
#import "NSMutableArray+QueueAddition.h"

@implementation NSMutableArray (QueueAddition)

- (void)enqueue:(id)obj
{
    [self addObject:obj];
}

- (id)dequeue
{
    if ([self count] == 0)
        return nil;
    
    id headObject = [self objectAtIndex:0];
    
    if (headObject != nil)
    {
        [[headObject retain] autorelease];
        [self removeObjectAtIndex:0];
    }
    
    return headObject;
}

@end
