//
//  PlayingCard.m
//  Matchismo
//
//  Created by Tracey on 13/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;



+ (NSArray *) validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits)
    {
        validSuits = @[@"♠️", @"♣️", @"♥️", @"♦️"];
    }
    return validSuits;
}



+ (NSArray *) rankStrings
{
    static NSArray *rankStrings = nil;
    
    if (!rankStrings)
    {
        rankStrings =
        @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
          @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    }
    
    return rankStrings;
}

+ (NSUInteger) maxRank
{
    return [self rankStrings].count - 1;
}

- (NSString *) contents
{
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void) setSuit: (NSString *) suit
{
    if ([[[self class] validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void) setRank: (NSUInteger) rank
{
    if (rank <= [[self class] maxRank])
    {
        _rank = rank;
    }
}

- (NSString *)description
{
    return self.contents;
}


@end
