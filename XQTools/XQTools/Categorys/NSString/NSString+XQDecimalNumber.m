//
//  NSString+XQDecimalNumber.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "NSString+XQDecimalNumber.h"

@implementation NSString (XQDecimalNumber)

- (NSDecimalNumber *)decimalNumber {
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:self];
    if ([[NSDecimalNumber notANumber] isEqualToNumber:number]) {
        return nil;
    }
    return number;
}

- (NSString *)numStringByAdding:(NSString *)string {
    return [self.decimalNumber decimalNumberByAdding:string.decimalNumber].stringValue;
}

- (NSString *)numStringBySubtracting:(NSString *)string {
    return [self.decimalNumber decimalNumberBySubtracting:string.decimalNumber].stringValue;
}

- (NSString *)numStringByMultiplyingBy:(NSString *)string {
    return [self.decimalNumber decimalNumberByMultiplyingBy:string.decimalNumber].stringValue;
}

- (NSString *)numStringByDividingBy:(NSString *)string {
    return [self.decimalNumber decimalNumberByDividingBy:string.decimalNumber].stringValue;
}

- (NSDecimalNumber *)decimalNumberWithBehavior:(id <NSDecimalNumberBehaviors>)behavior {
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:self];
    if ([[NSDecimalNumber notANumber] isEqualToNumber:number]) {
        return nil;
    }
    return [number decimalNumberByRoundingAccordingToBehavior:behavior];
}

@end
