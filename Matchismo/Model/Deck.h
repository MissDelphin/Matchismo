//
//  Deck.h
//  Matchismo
//
//  Created by Tracey on 13/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
//- (void)addCard:(Card *)card;

- (Card *) drawRandomCard;

@end
