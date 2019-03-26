//
//  DVMCardController.m
//  DeckOfOne-C
//
//  Created by Brooke Kumpunen on 3/26/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

@implementation DVMCardController

+ (DVMCardController *)shared
{
    static DVMCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[DVMCardController alloc] init];
    });
    return shared;
}

- (void)drawNewCard:(void (^)(DVMCard *))completion;
{
    //First, construct our URL and request. Let's start with the baseURL.
    NSURL *baseURL = [NSURL URLWithString: @"https://deckofcardsapi.com/api/deck/new/draw"];
    //Got the baseURL. Now, we need to append some stuff to it. Namely, just the number of cards we are drawing. That comes from the NSInteger parameter. We'll need that to be a string.
    NSString *cardCount = [@(1) stringValue];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    //Alright, got my componentized url. To u*se this specific api, this needs to be queryable. So now we have to add an NSURLQuertyItem. We'll use the key "count".
    NSURLQueryItem *cardQueryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    //Kk, got the query item. Now I need to say components.queryitems = [cardqueryitem]
    components.queryItems = @[cardQueryItem];
    //Got this as a query now. So let's make the final url be cmponents.url.
    NSURL *finalURL = components.URL;
    //Alrighty, got our finalURL. Now let's go call the dataTask using a URL and completion.
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //First things first, handle the error. Then handle the data AND the chance that there an error in that too XD Then complete under all that.
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        if(data) {
            NSDictionary *topLeveldictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (!topLeveldictionary || error) {
                NSLog(@"Error parsing the json: %@", error);
                completion(nil);
                return;
            }
            NSArray *cardDictionaries = topLeveldictionary[@"cards"];
            //Okay, now we are in the cards array. This is where all the json data I want is located. Now, we need to loop through this to get the list of dictionaries. We'll be taking the first one, as in this case, that's the only one.
            //We also need somewhere to store this data...the empty placeholder array. This is what we will be returning in the end.
            NSDictionary *cardDictionary = cardDictionaries[0];
            DVMCard *card = [[DVMCard alloc] initWithDictionary: cardDictionary];
            completion(card);
        }
    }] resume];
}

- (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    //We'll need a URL to the image, and then to call the dataTask. Easy.
    //The url is:
    NSURL *imageURL = [NSURL URLWithString: card.imageURL];
    //Got the image URL. Easy.
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data) {
            //Do something
            if (!data || error) {
                NSLog(@"Error parsing the json: %@", error);
                completion(nil);
                return;
            }
        }
        UIImage *cardImage = [UIImage imageWithData: data];
        completion(cardImage);
    }] resume];
}

@end
