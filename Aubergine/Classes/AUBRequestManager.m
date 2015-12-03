//
//  AUBRequestManager.m
//
//  Created by Tom Jowett on 28/03/2015.
//
//

#import "AUBRequestManager.h"

#import "AUBMe.h"
#import "AUBPriceEstimate.h"
#import "AUBProduct.h"
#import "AUBPromotion.h"
#import "AUBTimeEstimate.h"

NSString *kURL = @"https://api.uber.com";
NSString *kAPIVersion = @"v1";

@implementation AUBRequestManager

+ (instancetype)sharedInstance {
    static AUBRequestManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *serverToken = infoDictionary[kAUBRequestManagerServerTokenKey];
        NSAssert([serverToken isKindOfClass:[NSString class]] && [serverToken length] > 0, @"Server token must be a string with length > 0");
        sharedInstance = [[self alloc] initWithServerToken:serverToken];
    });    
    return sharedInstance;
}

- (instancetype)initWithServerToken:(NSString *)serverToken {
    NSParameterAssert(serverToken);
    NSURL *url = [NSURL URLWithString:kURL];
    self = [super initWithBaseURL:url];
    if (self) {
        [super setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [super setRequestSerializer:[AFJSONRequestSerializer serializer]];
        NSString *formattedServerToken = [NSString stringWithFormat:@"Token %@", serverToken];
        [super.requestSerializer setValue:formattedServerToken forHTTPHeaderField:@"Authorization"];
    }
    return self;
}

- (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(AUBRequestManagerSuccess)success
                       failure:(AUBRequestManagerFailure)failure {

    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kURL stringByAppendingPathComponent:kAPIVersion] stringByAppendingPathComponent:@"products"];
    NSDictionary *params = @{ @"latitude"  : @(location.latitude),
                              @"longitude" : @(location.longitude) };
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *productsJSON = responseObject[@"products"];
        
        NSMutableArray *products __block = [[NSMutableArray alloc] init];
        [productsJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            AUBProduct *product = [MTLJSONAdapter modelOfClass:AUBProduct.class fromJSONDictionary:obj error:&error];
            if (!error && product) {
                [products addObject:product];
                NSArray *result = [products copy];
                success(result);
            } else {
                failure(error);
            }
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
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
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *priceEstimatesJSON = responseObject[@"prices"];
        
        NSMutableArray *priceEstimates __block = [[NSMutableArray alloc] init];
        [priceEstimatesJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            AUBPriceEstimate *priceEstimate = [MTLJSONAdapter modelOfClass:AUBPriceEstimate.class fromJSONDictionary:obj error:&error];
            if (!error && priceEstimate) {
                [priceEstimates addObject:priceEstimate];
                NSArray *result = [priceEstimates copy];
                success(result);
            } else {
                failure(error);
            }
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
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
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *timeEstimatesJSON = responseObject[@"times"];
        
        NSMutableArray *timeEstimates __block = [[NSMutableArray alloc] init];
        [timeEstimatesJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            AUBTimeEstimate *timeEstimate = [MTLJSONAdapter modelOfClass:AUBTimeEstimate.class fromJSONDictionary:obj error:&error];
            if (!error && timeEstimate) {
                [timeEstimates addObject:timeEstimate];
                NSArray *result = [timeEstimates copy];
                success(result);
            } else {
                failure(error);
            }
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getPromotionsForStartLocation:(CLLocationCoordinate2D)startLocation
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
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        AUBPromotion *promotion = [MTLJSONAdapter modelOfClass:AUBPromotion.class fromJSONDictionary:responseObject error:&error];
        NSMutableArray *promotions = [[NSMutableArray alloc] init];
        if (!error && promotion) {
            [promotions addObject:promotion];
            NSArray *result = [promotions copy];
            success(result);
        } else {
            failure(error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getMeSuccess:(AUBRequestManagerGetMeSuccess)success
             failure:(AUBRequestManagerGetMeFailure)failure {
    
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kURL stringByAppendingPathComponent:kAPIVersion]
                     stringByAppendingPathComponent:@"me"];
    
    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        AUBMe *me = [MTLJSONAdapter modelOfClass:AUBMe.class fromJSONDictionary:responseObject error:&error];
        if (!error && me) {
            success(me);
        } else {
            failure(error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
