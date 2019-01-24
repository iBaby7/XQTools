//
//  NSString+XQSize.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "NSString+XQSize.h"

@implementation NSString (XQSize)

- (CGSize)suggestedSizeWithFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = CGSizeZero;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        CGRect bounds = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,  nil]
                                           context:nil];
        size = bounds.size;
    }
    return size;
}

@end
