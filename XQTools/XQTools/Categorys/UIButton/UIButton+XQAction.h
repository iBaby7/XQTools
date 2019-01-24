//
//  UIButton+XQAction.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XQAction)

- (void)setButtonBlock:(void (^)(NSInteger tag))block;

@end

