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

@end
