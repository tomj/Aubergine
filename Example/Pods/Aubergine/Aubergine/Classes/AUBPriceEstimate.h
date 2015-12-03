//
//  AUBPriceEstimate.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>

@interface AUBPriceEstimate : MTLModel <MTLJSONSerializing>

/// Unique identifier representing a specific product for a given latitude & longitude.
/// For example, uberX in San Francisco will have a different prod than uberX in Los Angeles.
@property (nonatomic, copy, readonly) NSString *productID;

/// ISO 4217 currency code.
@property (nonatomic, copy, readonly) NSString *currencyCode;

/// Display name of product.
@property (nonatomic, copy, readonly) NSString *displayName;

/// Formatted string of estimate in local currency of the start location.
/// Estimate could be a range, a single number (flat rate) or "Metered" for TAXI.
@property (nonatomic, copy, readonly) NSString *estimate;

/// Lower bound of the estimated price.
@property (nonatomic, assign, readonly) NSUInteger lowEstimate;

/// Upper bound of the estimated price.
@property (nonatomic, assign, readonly) NSUInteger highEstimate;

/// Expected surge multiplier. Surge is active if surge_multiplier is greater than 1.
/// Price estimate already factors in the surge multiplier.
@property (nonatomic, assign, readonly) double surgeMultiplier;

/// Expected activity duration (in seconds). Always show duration in minutes.
@property (nonatomic, assign, readonly) NSUInteger duration;

/// Expected activity distance (in miles).
@property (nonatomic, assign, readonly) double distance;

@end
