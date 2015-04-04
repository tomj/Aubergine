//
//  AUBProduct.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>

@interface AUBProduct : MTLModel <MTLJSONSerializing>

/// Unique identifier representing a specific product for a given latitude & longitude.
/// For example, uberX in San Francisco will have a different productID than uberX in Los Angeles.
@property (nonatomic, copy) NSString *productID;

@property (nonatomic, copy) NSString *productDescription;

@property (nonatomic, copy) NSString *displayName;

/// Capacity of product. For example, 4 people.
@property (nonatomic, assign) NSUInteger capacity;

/// Image URL representing the product.
@property (nonatomic, strong) NSURL *imageURL;

@property (nonatomic, copy, readonly) NSDate *retrievedAt;

@end