//
//  AUBUserHistory.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>

@interface AUBUserHistory : MTLModel <MTLJSONSerializing>

/// Position in pagination.
@property (nonatomic, assign) NSUInteger offset;

/// Number of items to retrieve (50 max).
@property (nonatomic, assign) NSUInteger limit;

///	Total number of items available.
@property (nonatomic, assign) NSUInteger count;

///	Unique activity identifier.
@property (nonatomic, copy) NSString *uuid;

/// Unix timestamp of activity request time.
@property (nonatomic, assign) NSUInteger requestTime;

/// Unique identifier representing a specific product for a given latitude & longitude.
/// For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
@property (nonatomic, copy) NSString *productID;

/// Status of the activity. Only returns completed for now.
@property (nonatomic, copy) NSString *status;

/// Length of activity in miles.
@property (nonatomic, assign) CGFloat distance;

///	Unix timestamp of activity start time.
@property (nonatomic, assign) NSUInteger startTime;

///	Unix timestamp of activity end time.
@property (nonatomic, assign) NSUInteger endTime;

@end
