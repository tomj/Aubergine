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

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"capacity"]) {
        self.capacity = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
