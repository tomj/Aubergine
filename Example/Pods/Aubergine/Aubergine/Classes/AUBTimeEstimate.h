//
//  AUBTimeEstimate.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>

@interface AUBTimeEstimate : MTLModel <MTLJSONSerializing>

/// Unique identifier representing a specific product for a given latitude & longitude.
/// For example, uberX in San Francisco will have a different productID than uberX in Los Angeles.
@property (nonatomic, copy, readonly) NSString *productID;

/// Display name of product.
@property (nonatomic, copy, readonly) NSString *displayName;

/// ETA for the product (in seconds). Always show estimate in minutes.
@property (nonatomic, assign, readonly) NSUInteger estimate;


///
/// Convenience
///

/// Estimate rounded up to whole minute with 'minute[s]' appended, "6 minutes" e.g.
@property (nonatomic, copy, readonly) NSString *estimateString;

@end
