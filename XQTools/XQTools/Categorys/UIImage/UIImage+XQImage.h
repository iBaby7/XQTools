//
//  UIImage+XQImage.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XQImage)

- (UIImage *)subImageInRect:(CGRect)rect;
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)scaleToFitSize:(CGSize)size;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

+ (UIImage *)rotateImage:(UIImage *)image;
- (UIImage *)fixOrientation;

+ (UIImage *)screenShotImage;
+ (UIImage *)imageWithColor:(UIColor *)color;

- (NSString *)base64Image;

+ (UIImage *)imageWithColor:(UIColor *)color andImg:(UIImage *)img;

@end
