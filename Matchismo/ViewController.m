//
//  ViewController.m
//  Matchismo
//
//  Created by Tracey on 13/02/2015.
//  Copyright (c) 2015 S9D Australia. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

- (Deck *)deck
{

    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck
{
    
    return [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int) flipCount
{
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
   
    if ([sender.currentTitle length])
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"card-back"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];

    } else
    {
        Card *randomCard = [self.deck drawRandomCard];
        if (randomCard) {
        [sender setBackgroundImage:[UIImage imageNamed:@"card-face"] forState:UIControlStateNormal];
        [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
    }
    self.flipCount++;
}

@end
