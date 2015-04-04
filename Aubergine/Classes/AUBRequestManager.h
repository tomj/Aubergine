//
//  AUBRequestManager.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^AUBRequestManagerSuccess) (NSArray *result);
typedef void (^AUBRequestManagerFailure) (NSError *error);

@interface AUBRequestManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *serverToken;

/// Return an array of AUBProduct objects if successful
+ (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(AUBRequestManagerSuccess)success
                       failure:(AUBRequestManagerFailure)failure;

/// Return an array of AUBPriceEstimate objects if successful
+ (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                              endLocation:(CLLocationCoordinate2D)endLocation
                                  success:(AUBRequestManagerSuccess)success
                                  failure:(AUBRequestManagerFailure)failure;

/// Return an array of AUBTimeEstimate objects if successful
+ (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                               productID:(NSString *)productID
                            customerUUID:(NSString *)customerUUID
                                 success:(AUBRequestManagerSuccess)success
                                 failure:(AUBRequestManagerFailure)failure;

/// Return an array of AUBPromotion objects if successful
+ (void)getPromotionsForStartLocation:(CLLocationCoordinate2D)startLocation
                          endLocation:(CLLocationCoordinate2D)endLocation
                              success:(AUBRequestManagerSuccess)success
                              failure:(AUBRequestManagerFailure)failure;

@end
