//
//  NSString+XQDecimalNumber.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XQDecimalNumber)

@property (nonatomic, readonly) NSDecimalNumber *decimalNumber;

- (NSString *)numStringByAdding:(NSString *)string;         //加
- (NSString *)numStringBySubtracting:(NSString *)string;    //减
- (NSString *)numStringByMultiplyingBy:(NSString *)string;  //乘
- (NSString *)numStringByDividingBy:(NSString *)string;     //除
- (NSDecimalNumber *)decimalNumberWithBehavior:(id <NSDecimalNumberBehaviors>)behavior;

@end

