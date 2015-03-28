//
//  AUBRequest.h
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^AUBRequestSuccess) (NSArray *result);
typedef void (^AUBRequestFailure) (NSError *error);

@interface AUBRequest : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *serverToken;

+ (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(AUBRequestSuccess)success
                       failure:(AUBRequestFailure)failure;

+ (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                              endLocation:(CLLocationCoordinate2D)endLocation
                                  success:(AUBRequestSuccess)success
                                  failure:(AUBRequestFailure)failure;

+ (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                             endLocation:(CLLocationCoordinate2D)endLocation
                                 success:(AUBRequestSuccess)success
                                 failure:(AUBRequestFailure)failure;

+ (void)getPromotionsForStartLocation:(CLLocationCoordinate2D)startLocation
                          endLocation:(CLLocationCoordinate2D)endLocation
                              success:(AUBRequestSuccess)success
                              failure:(AUBRequestFailure)failure;

@end
