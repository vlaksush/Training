//
//  ObjCUser.h
//  SwiftObjCInteropDemo
//
//  Created by Ravi Shankar on 11/09/24.
//

#import <Foundation/Foundation.h>

@interface ObjCUser : NSObject

- (void)useSwiftPerson;
- (void)useSwiftClosure:(void (^)(NSString *))closure;

@end
