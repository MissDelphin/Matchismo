//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Tracey on 17/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "deck.h"

@interface CardMatchingGame : NSObject

// designated initialiser
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;
   
   @property (nonatomic, readonly) NSInteger score;

@end
