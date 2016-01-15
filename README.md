# Vivira Health iOS interview test

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

## Stubs

Because of how UI tests work, we cannot directly interact with the app at runtime, so any HTTP mocking or manipulation of things like NSUserDefaults in a XCUITestCase will not affect our app.

To be able to mock HTTP or setup & teardown our apps environment for specific UI tests, we will need to set launch arguments or launch environment variables before launching the app in the setUp() method of a XCUITestCase and then modify our app code to read the launch arguments or environment variables and bootstrap the test environment

