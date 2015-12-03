//
//  AUBProduct.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>

@class AUBPriceDetails;

@interface AUBProduct : MTLModel <MTLJSONSerializing>

/// Unique identifier representing a specific product for a given latitude & longitude.
/// For example, uberX in San Francisco will have a different productID than uberX in Los Angeles.
@property (nonatomic, copy, readonly) NSString *productID;

@property (nonatomic, copy, readonly) NSString *productDescription;

@property (nonatomic, copy, readonly) NSString *displayName;

/// Capacity of product. For example, 4 people.
@property (nonatomic, assign, readonly) NSUInteger capacity;

/// Image URL representing the product.
@property (nonatomic, strong, readonly) NSURL *imageURL;

@property (nonatomic, strong, readonly) AUBPriceDetails *priceDetails;

@end