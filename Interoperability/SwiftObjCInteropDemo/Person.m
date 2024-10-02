//
//  Person.m
//  SwiftObjCInteropDemo
//
//  Created by Ravi Shankar on 11/09/24.
//

// Person.m
#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

- (void)sayHello {
    NSLog(@"Hello, I'm %@ and I'm %ld years old.", self.name, (long)self.age);
}

@end
