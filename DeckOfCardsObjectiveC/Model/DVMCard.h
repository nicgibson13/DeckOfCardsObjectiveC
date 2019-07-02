//
//  DVMCard.h
//  DeckOfCardsObjectiveC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *image;

- (instancetype) initWithCardSuit:(NSString *)suit
                            image:(NSString *)image;

@end

@interface DVMCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
