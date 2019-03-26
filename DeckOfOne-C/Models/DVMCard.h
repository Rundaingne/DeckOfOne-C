//
//  DVMCard.h
//  DeckOfOne-C
//
//  Created by Brooke Kumpunen on 3/26/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *imageURL;

-(instancetype)initWithsuit:(NSString *)suit imageURL:(NSString *)imageURL;

@end

NS_ASSUME_NONNULL_END
