//
//  AUBUser.h
//  Pods
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>

@interface AUBUser : MTLModel <MTLJSONSerializing>

/// First name of the Uber user.
@property (nonatomic, copy) NSString *firstName;

///	Last name of the Uber user.
@property (nonatomic, copy) NSString *lastName;

///	Email address of the Uber user.
@property (nonatomic, copy) NSString *email;

///	Image URL of the Uber user.
@property (nonatomic, copy) NSString *picture;

///	Promo code of the Uber user.
@property (nonatomic, copy) NSString *promoCode;

///	Unique identifier of the Uber user.
@property (nonatomic, copy) NSString *uuid;

@end
