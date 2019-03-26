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

//We've got our properties above, and the initializer for them to create an instance of a Card. Now we need to have another initializer for a dictionary.

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id > *)dictionary;

@end

NS_ASSUME_NONNULL_END
