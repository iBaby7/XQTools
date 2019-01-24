//
//  NSString+XQPredicate.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XQPredicate)

@property (nonatomic, readonly) BOOL isValidEmail;
@property (nonatomic, readonly) BOOL isValidPhoneNum;
@property (nonatomic, readonly) BOOL isValidPassword;
@property (nonatomic, readonly) BOOL isValidSMSCode;
@property (nonatomic, readonly) BOOL isValidIdCardNum;
@property (nonatomic, readonly) BOOL isValidChineseName;
@property (nonatomic, readonly) BOOL isPureFloat;
@property (nonatomic, readonly) BOOL isBlankString;

- (BOOL)isIncludeSubstring:(NSString *)substring;

@end

