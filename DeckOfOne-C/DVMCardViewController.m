//
//  DVMCardViewController.m
//  DeckOfOne-C
//
//  Created by Brooke Kumpunen on 3/26/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "DVMCardViewController.h"
#import "DVMCardController.h"

@interface DVMCardViewController ()

//Remember, outlets go up here in this language.
@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;


@end

@implementation DVMCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)updateViews
{
    [[DVMCardController shared] drawNewCard:^(DVMCard *card) {
        dispatch_async(dispatch_get_main_queue(), ^{self.suitLabel.text = card.suit;});
        [[DVMCardController shared] fetchCardImage:card completion:^(UIImage *cardImage) {
            dispatch_async(dispatch_get_main_queue(), ^{self.cardImageView.image = cardImage;});
        }];
    }];
}

//MARK: - Actions
- (IBAction)drawCardButtonTapped:(UIButton *)sender {
    
    [self updateViews];
}


@end
