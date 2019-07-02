//
//  DVMCard.m
//  DeckOfCardsObjectiveC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation DVMCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];
    return [self initWithCardSuit:suit image:image];
}


@end


