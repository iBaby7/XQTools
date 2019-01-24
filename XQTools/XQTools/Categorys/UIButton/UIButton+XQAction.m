//
//  UIButton+XQAction.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "UIButton+XQAction.h"
#import <objc/runtime.h>

const NSString *kButtonActionHandlerBlockKey = @"ButtonActionHandlerBlockKey";

@implementation UIButton (XQAction)

- (void)setButtonBlock:(void (^)(NSInteger tag))block {
    objc_setAssociatedObject(self, &kButtonActionHandlerBlockKey, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(__handleActionForButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)__handleActionForButton {
    void(^action)(NSInteger tag) = objc_getAssociatedObject(self, &kButtonActionHandlerBlockKey);
    if (action) {action(self.tag);}
}

@end
