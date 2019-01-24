//
//  UIView+XQFunction.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "UIView+XQFunction.h"
#import <objc/runtime.h>

const NSString *kViewActionHandlerTapGestureKey = @"ViewActionHandlerTapGestureKey";
const NSString *kViewActionHandlerTapBlockKey = @"ViewActionHandlerTapBlockKey";

@implementation UIView (XQFunction)

- (UIImage *)exportToImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

- (UIImage *)exportToImage:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

- (UIViewController *)viewController {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass: [UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}

- (void)setTapActionWithBlock:(void (^)(void))block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, &kViewActionHandlerTapGestureKey);
    if (!tap) {
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:tap];
        objc_setAssociatedObject(self, &kViewActionHandlerTapGestureKey, tap, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kViewActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        void(^action)(void) = objc_getAssociatedObject(self, &kViewActionHandlerTapBlockKey);
        if (action){action();}
    }
}

@end
