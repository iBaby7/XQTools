//
//  NSString+XQSize.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (XQSize)

- (CGSize)suggestedSizeWithFont:(UIFont *)font width:(CGFloat)width;

@end
