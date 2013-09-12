//
//  LCRQuestionRepositoring.h
//  trivia
//
//  Created by Pedro Vereza on 9/10/13.
//  Copyright (c) 2013 Legacy Coderetreat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCRQuestionCategory.h"

@protocol LCRQuestionRepositoring <NSObject>

- (void)addQuestion:(NSString*)aQuestion forCategory:(LCRQuestionCategory)aCategory;

- (NSString*)getQuestionForCategory:(LCRQuestionCategory)aCategory;

@end
