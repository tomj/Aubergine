//
//  AUBPromotion.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBPromotion.h"

@implementation AUBPromotion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"displayText":    @"display_text",
             @"localizedValue": @"localized_value",
             @"type":           @"type",
             };
}

@end
