//
//  AUBMe.m
//  
//
//  Created by Tom Jowett on 3/12/2015.
//
//

#import "AUBMe.h"

@implementation AUBMe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"firstName":        @"first_name",
             @"lastName":         @"last_name",
             @"email":            @"email",
             @"pictureURL":       @"picture_url",
             @"promoCode":        @"promo_code",
             @"uuid":             @"uuid"
             };
}

+ (NSValueTransformer *)pictureURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
