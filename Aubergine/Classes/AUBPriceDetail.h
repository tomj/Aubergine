//
//  AUBPriceDetail.h
//
//  Created by Tom Jowett on 5/04/2015.
//
//

#import <Mantle/Mantle.h>

@interface AUBPriceDetail : MTLModel <MTLJSONSerializing>

/// The base price.
@property (nonatomic, assign, readonly) double base;

/// The minimum price of a trip.
@property (nonatomic, assign, readonly) double minimum;

/// The charge per minute (if applicable for the product type).
@property (nonatomic, assign, readonly) double costPerMinute;

/// The charge per distance unit (if applicable for the product type).
@property (nonatomic, assign, readonly) double costPerDistance;

/// The unit of distance used to calculate the fare (either mile or km).
@property (nonatomic, copy, readonly) NSString *distanceUnit;

/// The fee if a rider cancels the trip after the grace period.
@property (nonatomic, assign, readonly) double cancellationFee;

/// ISO 4217 currency code.
@property (nonatomic, copy, readonly) NSString *currencyCode;

/// Array containing additional fees added to the price of a product.
/// Fees are an NSDictionary with keys @"name" (string) and @"fee" (float)
@property (nonatomic, strong, readonly) NSArray *serviceFees;

@end
