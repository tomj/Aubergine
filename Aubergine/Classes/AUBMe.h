//
//  AUBMe.h
//  
//
//  Created by Tom Jowett on 3/12/2015.
//
//

#import <Mantle/Mantle.h>

@interface AUBMe : MTLModel <MTLJSONSerializing>

/// First name of the Uber user.
@property (nonatomic, copy, readonly) NSString *firstName;

/// Last name of the Uber user.
@property (nonatomic, copy, readonly) NSString *lastName;

/// Email address of the Uber user.
@property (nonatomic, copy, readonly) NSString *email;

/// Image URL of the Uber user.
@property (nonatomic, strong, readonly) NSURL *pictureURL;

/// Promo code of the Uber user.
@property (nonatomic, copy, readonly) NSString *promoCode;

/// Unique identifier of the Uber user.
@property (nonatomic, copy, readonly) NSString *uuid;

@end
