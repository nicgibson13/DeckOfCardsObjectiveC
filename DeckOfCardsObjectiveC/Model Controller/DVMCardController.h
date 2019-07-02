//
//  DVMCardController.h
//  DeckOfCardsObjectiveC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DVMCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject


+ (DVMCardController *) sharedController;

+(void)drawANewCard:(void(^) (DVMCard *))completion;

+(void)fetchCardImage:(DVMCard *)card completion:(void(^) (UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
