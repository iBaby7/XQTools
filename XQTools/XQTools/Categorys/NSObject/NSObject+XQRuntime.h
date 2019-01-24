//
//  NSObject+XQRuntime.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XQRuntime)

- (id)associatedObjectForKey:(NSString*)key;
- (void)setAssociatedObject:(id)object forKey:(NSString*)key;

@end
