//
//  ObjCUser.m
//  SwiftObjCInteropDemo
//
//  Created by Ravi Shankar on 11/09/24.
//

#import "ObjCUser.h"
#import "SwiftObjCInteropDemo-Swift.h"

@implementation ObjCUser

- (void)useSwiftPerson {
    SwiftPerson *swiftPerson = [[SwiftPerson alloc] initWithName:@"Alice" age:28];
    [swiftPerson introduce];
}

- (void)useSwiftClosure:(void (^)(NSString *))closure {
    closure(@"Hello from Objective-C!");
}

@end
