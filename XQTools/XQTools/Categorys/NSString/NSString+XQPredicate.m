//
//  NSString+XQPredicate.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "NSString+XQPredicate.h"

@implementation NSString (XQPredicate)

- (BOOL)isValidEmail {
    return [self predicateByString:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

- (BOOL)isValidPhoneNum {
    return [self predicateByString:@"1\\d{10}"];
}

- (BOOL)isValidPassword {
    return [self predicateByString:@"[0-9a-zA-Z;',./~!@#$%^&*()_+|{}:\"<>?-]{6,20}"];
}

- (BOOL)isValidSMSCode {
    return [self predicateByString:@"\\d{6}"];
}

- (BOOL)isValidIdCardNum {
    if (self.length <= 0) {
        return NO;
    }
    if (![self predicateByString:@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X|x)$"]) {
        return NO;
    }
    //计算最后一位校验字符
    NSMutableString *identity = [[NSMutableString alloc] initWithString:self];
    int wArr[] = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
    int sum = 0;
    for (int i=0; i<17; i++) {
        sum += ([identity characterAtIndex:i]-48)*wArr[i];
    }
    int result[] = {1,0,-1,9,8,7,6,5,4,3,2};
    int resultValue = result[sum%11];
    if (resultValue != -1) {
        if ([[self substringFromIndex:self.length-1] intValue] == resultValue) {
            return YES;
        }
        else{
            return NO;
        }
    }
    else{
        if ([[self substringFromIndex:self.length-1] isEqualToString:@"X"]||[[self substringFromIndex:self.length-1] isEqualToString:@"x"]) {
            return YES;
        }
        else{
            return NO;
        }
    }
    return YES;
}

- (BOOL)isValidChineseName {
    return [self predicateByString:@"[\u4E00-\u9FA5]{1,30}"];
}

- (BOOL)predicateByString:(NSString *)string {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", string];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)isIncludeSubstring:(NSString *)substring {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",substring];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isBlankString {
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
