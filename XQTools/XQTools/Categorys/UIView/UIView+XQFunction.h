//
//  UIView+XQFunction.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XQFunction)

//截图
- (UIImage *)exportToImage;
//截图（指定大小）
- (UIImage *)exportToImage:(CGSize)size;
//获取view所在的viewController
- (UIViewController *)viewController;
//添加点击事件
- (void)setTapActionWithBlock:(void (^)(void))block;

@end
