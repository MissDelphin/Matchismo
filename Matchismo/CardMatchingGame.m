//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Tracey on 17/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // keep track of cards drawn or turned over
@end


@implementation CardMatchingGame
// Lazy instantiation
- (NSMutableArray *)cards
{
    if (! _cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init]; //Super class's designated initialisier itself and checking for a failure return of nil
    
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (card) // this if protects against nil crashing the NSMutableArray
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil; //self is nill so that it returns we cannot initalise with the given arguments
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    //return self.cards[index];
    return (index<[self.cards count]) ? self.cards[index] : nil; //public method needs assertion that the argument is not out of bounds ? is if/then in c too large an index/exception would crash, out of bounds
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched)
    {
        
        if (!card.isChosen)
        {
            card.chosen = NO;
        }
    
        else //match against other cards
        {
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchScore = [card match:@[otherCard]];
                
                    if (matchScore)
                    {
                        self.score += (matchScore * MATCH_BONUS);
                        otherCard.matched = YES;
                        card.matched = YES;
                    }
                
                    else
                    {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                
                    break; //can only choose two cards for now
                
                }
            }
        
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
