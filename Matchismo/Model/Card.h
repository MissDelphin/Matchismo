//
//  Card.h
//  Matchismo
//
//  Created by Tracey on 13/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otheCards;

@end
