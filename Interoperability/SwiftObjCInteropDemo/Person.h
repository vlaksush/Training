//
//  Person.h
//  SwiftObjCInteropDemo
//
//  Created by Ravi Shankar on 11/09/24.
//

// Person.h
#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)sayHello;

@end

