//
//  DVMCardController.h
//  DeckOfOne-C
//
//  Created by Brooke Kumpunen on 3/26/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVMCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

//Our singleton looks like this:
+ (DVMCardController *)shared;

//Now, let's set up a function to draw a card. This will get called when the button gets tapped.
- (void)drawNewCard:(void (^)(DVMCard *))completion;

- (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion;
                                                            
@end

NS_ASSUME_NONNULL_END
