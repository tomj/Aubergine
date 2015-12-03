//
//  AUBPromotion.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>


@interface AUBPromotion : MTLModel <MTLJSONSerializing>

///	A localized string we recommend to use when offering the promotion to users.
@property (nonatomic, copy, readonly) NSString *displayText;

/// The value of the promotion that is available to a user in this location in the local currency.
@property (nonatomic, copy, readonly) NSString *localizedValue;

/// The type of the promo which is either "trip_credit" or "account_credit".
@property (nonatomic, copy, readonly) NSString *type;

@end
