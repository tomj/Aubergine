//
//  AUBTimeEstimate.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>

@interface AUBTimeEstimate : MTLModel <MTLJSONSerializing>

/// Unique identifier representing a specific product for a given latitude & longitude.
/// For example, uberX in San Francisco will have a different productID than uberX in Los Angeles.
@property (nonatomic, copy) NSString *productID;

/// Display name of product.
@property (nonatomic, copy) NSString *displayName;

/// ETA for the product (in seconds). Always show estimate in minutes.
@property (nonatomic, assign) NSUInteger estimate;

@end
