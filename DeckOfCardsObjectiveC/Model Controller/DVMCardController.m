//
//  DVMCardController.m
//  DeckOfCardsObjectiveC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

@implementation DVMCardController

+ (DVMCardController *)sharedController
{
    static DVMCardController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [DVMCardController new];
    });
    return sharedController;
}

+ (void)drawANewCard:(void (^)(DVMCard *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          if (error)
          {
              NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
              completion(nil);
              return;
          }
          if (response)
          {
              NSLog(@"%@", response);
          }
          
          if (data)
          {
              NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
              
              if (!topLevelDictionary)
              {
                  NSLog(@"Error parsing the JSON: %@", error);
                  completion(nil);
                  return;
              }
              
              NSArray *cardsArray = topLevelDictionary[@"cards"];
              NSMutableArray *cardsPlaceholder = [[NSMutableArray alloc] init];
              for (NSDictionary *dictionary in cardsArray)
              {
                  
                  DVMCard *newCard = [[DVMCard alloc] initWithDictionary: dictionary];
                  [cardsPlaceholder addObject:newCard];
              }
              completion(cardsPlaceholder);
          }
          
      }] resume];
}

+ (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString: card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            UIImage *cardImage = [UIImage imageWithData:data];
            completion(cardImage);
        }
        
    }] resume];
}
     @end
