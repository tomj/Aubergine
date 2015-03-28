//
//  AUBProduct.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBProduct.h"

@implementation AUBProduct

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"productID": @"product_id",
             @"productDescription": @"description",
             @"displayName": @"display_name",
             @"capacity": @"capacity",
             @"imageURL": @"image",
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)HTMLURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self) {
        _retrievedAt = [NSDate date];
    }
    return self;
}


@end
