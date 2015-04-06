//
//  AUBTimeEstimate.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBTimeEstimate.h"

@implementation AUBTimeEstimate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"productID":    @"product_id",
             @"displayName":  @"display_name",
             @"estimate":     @"estimate"
             };
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"estimate"]) {
        self.estimate = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

- (NSString *)estimateString {
    
    unsigned long estimate = (self.estimate/60) + 1;
    
    NSString *str = nil;
    if (estimate == 1) {
       str = [NSString stringWithFormat:@"%lu minute", estimate];
    } else {
        str = [NSString stringWithFormat:@"%lu minutes", estimate];
    }
    
    return str;
}


@end
