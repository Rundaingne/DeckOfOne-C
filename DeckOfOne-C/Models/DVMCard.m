//
//  DVMCard.m
//  DeckOfOne-C
//
//  Created by Brooke Kumpunen on 3/26/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

- (instancetype)initWithsuit:(NSString *)suit imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _imageURL = imageURL;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *imageURL = dictionary[@"image"];
    return [self initWithsuit:suit imageURL:imageURL];
}

@end
