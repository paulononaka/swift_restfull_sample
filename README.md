# A simple CRUD app sample that manager users through a REST API (JSON)

## Requirements

- iOS 8.2+
- Xcode 7.2+

## Installation

- Install CocoaPods if you don't have it

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

- Install dependencies

```bash
$ pod install
```

## Used libraries

- Alamofire: Alamofire is an HTTP networking library written in Swift.
- AlamofireObjectMapper: An Alamofire extension which converts JSON response data into swift objects using ObjectMapper.
- OHHTTPStubs: OHHTTPStubs is a library designed to stub your network requests very easily.
- OHHTTPStubs/Swift: Adds some global function helpers to make the use of OHHTTPStubs more compact and Swift-like.
- ReachabilitySwift: Replacement for Apple's Reachability re-written in Swift with closures
- SwiftLoader: A simple and beautiful activity indicator written in Swift
- KFSwiftImageLoader: An extremely high-performance, lightweight, and energy-efficient pure Swift async web image loader with memory and disk caching for iOS and Smart Watch.

## UI Tests

- Stubs:

To be able to mock HTTP requests in our app for UI tests, we had to launch environment variables before launching the app in the setUp() method of the XCUITestCases and then modify our app code to read the environment variables and to bootstrap OHHTTPStubs.

This is due because of how UI tests work. In UI Test environment we cannot directly interact with the app at runtime, so any HTTP mocking or manipulation of things like NSUserDefaults in a XCUITestCase can not affect the app.

- Running on simulator:

Make sure 'Hardware -> Keyboard -> Connect hardware keyboard' is off!
