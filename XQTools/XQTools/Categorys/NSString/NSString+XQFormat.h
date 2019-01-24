//
//  NSString+XQFormat.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XQFormat)

@property (nonatomic, readonly) NSString *md5;
@property (nonatomic, readonly) NSString *sha1;
@property (nonatomic, readonly) NSString *encodeUrl;
@property (nonatomic, readonly) NSString *f2;
@property (nonatomic, readonly) NSString *safeMobileNumber;
@property (nonatomic, readonly) NSString *safeIDNumber;
@property (nonatomic, readonly) NSString *safeUserName;
@property (nonatomic, readonly) NSString *fenToYuan;
@property (nonatomic, readonly) NSString *yuanToFen;
@property (nonatomic, readonly) NSString *bankCodeFormatWithBlankSep;
@property (nonatomic, readonly) NSString *percentEscapedString;
@property (nonatomic, readonly) NSString *numStringTrim0;

@end

