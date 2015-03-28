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

@end
