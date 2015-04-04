//
//  AUBRequestManager.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^AUBRequestManagerSuccess) (NSArray *result);
typedef void (^AUBRequestManagerFailure) (NSError *error);

static NSString *const kAUBRequestManagerServerTokenKey = @"AUBRequestManagerServerTokenKey";

@interface AUBRequestManager : AFHTTPRequestOperationManager

/**
 *  @return An AUBRequestManager.  Note the the application's info.plist file must contain
 *          an object for the kAUBRequestManagerServerTokenKey key, otherwise an assertion
 *          will go boom.
 */
+ (instancetype)sharedInstance;

- (instancetype)initWithServerToken:(NSString *)serverToken;

@property (nonatomic, copy) NSString *serverToken;

/// Return an array of AUBProduct objects if successful
- (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(AUBRequestManagerSuccess)success
                       failure:(AUBRequestManagerFailure)failure;

/// Return an array of AUBPriceEstimate objects if successful
- (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                              endLocation:(CLLocationCoordinate2D)endLocation
                                  success:(AUBRequestManagerSuccess)success
                                  failure:(AUBRequestManagerFailure)failure;

/// Return an array of AUBTimeEstimate objects if successful
- (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                               productID:(NSString *)productID
                            customerUUID:(NSString *)customerUUID
                                 success:(AUBRequestManagerSuccess)success
                                 failure:(AUBRequestManagerFailure)failure;

/// Return an array of AUBPromotion objects if successful
- (void)getPromotionsForStartLocation:(CLLocationCoordinate2D)startLocation
                          endLocation:(CLLocationCoordinate2D)endLocation
                              success:(AUBRequestManagerSuccess)success
                              failure:(AUBRequestManagerFailure)failure;

@end
