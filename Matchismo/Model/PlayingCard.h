//
//  PlayingCard.h
//  Matchismo
//
//  Created by Tracey on 13/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
