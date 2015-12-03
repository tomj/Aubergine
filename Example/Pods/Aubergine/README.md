# Aubergine

Aubergine is an iOS SDK for the [Uber API](https://developer.uber.com).

Aubergine uses the [Mantle](https://github.com/Mantle/Mantle) framework for JSON serialization in conjunction with [AFNetworking](https://github.com/AFNetworking/AFNetworking).  Feel free to submit PR's and we'd love to hear if you're using it in your own project.

[![Build Status](https://travis-ci.org/tomj/Aubergine.svg?branch=master)](https://travis-ci.org/tomj/Aubergine)
[![Version](https://img.shields.io/cocoapods/v/Aubergine.svg?style=flat)](http://cocoapods.org/pods/Aubergine)
[![License](https://img.shields.io/cocoapods/l/Aubergine.svg?style=flat)](http://cocoapods.org/pods/Aubergine)
[![Platform](https://img.shields.io/cocoapods/p/Aubergine.svg?style=flat)](http://cocoapods.org/pods/Aubergine)

## Installation

Aubergine is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Aubergine"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

To run Aubergine in your own app, in your app's info.plist file add a row with "AUBRequestManagerServerTokenKey" and the value of your Uber API server token and then get started making Uber requests.

```objc
#import <Aubergine/Aubergine.h>

AUBRequestManager *manager = [AUBRequestManager sharedInstance];

CLLocationCoordinate2D location = CLLocationCoordinate2DMake(40.7356, -73.9906);
[manager getProductsForLocation:location success:^(NSArray *result) {
    NSLog(@"%@", result);
} failure:^(NSError *error) {
    NSLog(@"%@", error);
}];
```

Alternatively you can create your own instances of `AUBRequestManager` and set the server token directly for each manager
```objc

AUBRequestManager *manager = [[AUBRequestManager alloc] initWithServerToken:@"YOUR_SERVER_TOKEN"];

CLLocationCoordinate2D location = CLLocationCoordinate2DMake(40.7356, -73.9906);
[manager getProductsForLocation:location success:^(NSArray *result) {
NSLog(@"%@", result);
} failure:^(NSError *error) {
NSLog(@"%@", error);
}];
```

## Requirements

iOS 6+

## Author

Tom Jowett, [@tjrebase](https://www.twitter.com/tjrebase)

## License

Aubergine is available under the MIT license. See the LICENSE file for more info.
