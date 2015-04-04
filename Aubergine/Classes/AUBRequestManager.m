//
//  AUBRequestManager.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBRequestManager.h"

#import <AFNetworking/AFNetworking.h>

#import "AUBProduct.h"
#import "AUBPriceEstimate.h"
#import "AUBTimeEstimate.h"
#import "AUBPromotion.h"

NSString *kURL = @"https://api.uber.com";
NSString *kAPIVersion = @"v1";

@implementation AUBRequestManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });    
    return _sharedInstance;
}

+ (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(AUBRequestManagerSuccess)success
                       failure:(AUBRequestManagerFailure)failure {

    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kURL stringByAppendingPathComponent:kAPIVersion] stringByAppendingPathComponent:@"products"];
    NSDictionary *params = @{ @"latitude"  : @(location.latitude),
                              @"longitude" : @(location.longitude) };
    
    [[[self class] manager] GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *productsJSON = responseObject[@"products"];
        
        NSMutableArray *products __block = [[NSMutableArray alloc] init];
        [productsJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            AUBProduct *product = [MTLJSONAdapter modelOfClass:AUBProduct.class fromJSONDictionary:obj error:&error];
            if (!error && product) {
                [products addObject:product];
            }
        }];
        NSArray *result = [products copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                              endLocation:(CLLocationCoordinate2D)endLocation
                                  success:(AUBRequestManagerSuccess)success
                                  failure:(AUBRequestManagerFailure)failure {
    
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[[kURL stringByAppendingPathComponent:kAPIVersion]
                            stringByAppendingPathComponent:@"estimates"]
                            stringByAppendingPathComponent:@"price"];
    
    NSDictionary *params = @{ @"start_latitude"  : @(startLocation.latitude),
                              @"start_longitude" : @(startLocation.longitude),
                              @"end_latitude"    : @(endLocation.latitude),
                              @"end_longitude"   : @(endLocation.longitude) };
    
    [[[self class] manager] GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *priceEstimatesJSON = responseObject[@"prices"];
        
        NSMutableArray *priceEstimates __block = [[NSMutableArray alloc] init];
        [priceEstimatesJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            AUBPriceEstimate *priceEstimate = [MTLJSONAdapter modelOfClass:AUBPriceEstimate.class fromJSONDictionary:obj error:&error];
            if (!error && priceEstimate) {
                [priceEstimates addObject:priceEstimate];
            }
        }];
        NSArray *result = [priceEstimates copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                               productID:(NSString *)productID
                            customerUUID:(NSString *)customerUUID
                                 success:(AUBRequestManagerSuccess)success
                                 failure:(AUBRequestManagerFailure)failure {
    
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[[kURL stringByAppendingPathComponent:kAPIVersion]
                       stringByAppendingPathComponent:@"estimates"]
                       stringByAppendingPathComponent:@"time"];
    
    NSMutableDictionary *params = @{ @"start_latitude"  : @(startLocation.latitude),
                                     @"start_longitude" : @(startLocation.longitude) }.mutableCopy;
    if (customerUUID && [customerUUID isKindOfClass:[NSString class]]) [params setObject:customerUUID forKey:@"customer_uuid"];
    if (productID && [productID isKindOfClass:[NSString class]]) [params setObject:productID forKey:@"product_id"];
    
    [[[self class] manager] GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *timeEstimatesJSON = responseObject[@"times"];
        
        NSMutableArray *timeEstimates __block = [[NSMutableArray alloc] init];
        [timeEstimatesJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            AUBTimeEstimate *timeEstimate = [MTLJSONAdapter modelOfClass:AUBTimeEstimate.class fromJSONDictionary:obj error:&error];
            if (!error && timeEstimate) {
                [timeEstimates addObject:timeEstimate];
            }
        }];
        NSArray *result = [timeEstimates copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)getPromotionsForStartLocation:(CLLocationCoordinate2D)startLocation
                          endLocation:(CLLocationCoordinate2D)endLocation
                              success:(AUBRequestManagerSuccess)success
                              failure:(AUBRequestManagerFailure)failure {
    
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kURL stringByAppendingPathComponent:kAPIVersion]
                      stringByAppendingPathComponent:@"promotions"];
    
    NSDictionary *params = @{ @"start_latitude"  : @(startLocation.latitude),
                              @"start_longitude" : @(startLocation.longitude),
                              @"end_latitude"    : @(endLocation.latitude),
                              @"end_longitude"   : @(endLocation.longitude) };
    
    [[[self class] manager] GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        AUBPromotion *promotion = [MTLJSONAdapter modelOfClass:AUBPromotion.class fromJSONDictionary:responseObject error:&error];
        NSMutableArray *promotions = [[NSMutableArray alloc] init];
        if (!error && promotion) {
            [promotions addObject:promotion];
        }
        NSArray *result = [promotions copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

#pragma mark - Private

+ (AFHTTPRequestOperationManager *)manager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSAssert([[AUBRequestManager sharedInstance] serverToken], @"Server token must be provided for requests");
    NSString *serverToken = [NSString stringWithFormat:@"Token %@", [[AUBRequestManager sharedInstance] serverToken]];
    [manager.requestSerializer setValue:serverToken forHTTPHeaderField:@"Authorization"];
    return manager;
}

@end
