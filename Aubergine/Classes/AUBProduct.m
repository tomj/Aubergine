//
//  AUBProduct.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBProduct.h"

#import "AUBPriceDetail.h"

@implementation AUBProduct

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"productID": @"product_id",
             @"productDescription": @"description",
             @"displayName": @"display_name",
             @"capacity": @"capacity",
             @"imageURL": @"image",
             @"priceDetails": @"price_details"
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)priceDetailsJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:AUBPriceDetail.class];
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"capacity"]) {
        _capacity = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
