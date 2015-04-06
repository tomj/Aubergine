//
//  AUBPriceEstimate.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBPriceEstimate.h"

@implementation AUBPriceEstimate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"productID":    @"product_id",
             @"currencyCode": @"currency_code",
             @"displayName":  @"display_name",
             @"estimate":     @"estimate",
             @"lowEstimate":  @"low_estimate",
             @"highEstimate": @"high_estimate",
             @"surgeMultiplier" : @"surge_multiplier",
             @"duration":     @"duration",
             @"distance":     @"distance"
             };
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"lowEstimate"]) {
        _lowEstimate = 0;
    } else if ([key isEqualToString:@"highEstimate"]) {
        _highEstimate = 0;
    } else if ([key isEqualToString:@"surgeMultiplier"]) {
        _surgeMultiplier = 1.0;
    } else if ([key isEqualToString:@"distance"]) {
        _distance = 0.0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
