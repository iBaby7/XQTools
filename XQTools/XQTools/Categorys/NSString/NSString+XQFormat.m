//
//  NSString+XQFormat.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "NSString+XQFormat.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (XQFormat)

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,(int)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)sha1 {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

- (NSString *)encodeUrl {
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedUrl = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedUrl;
}

- (NSString *)f2 {
    float balance = [self floatValue];
    return [NSString stringWithFormat:@"%.2f", balance];
}

- (NSString *)safeMobileNumber {
    if (self.length >= 11) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    else {
        return self;
    }
}

- (NSString *)safeIDNumber {
    if (self.length > 5) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, self.length-5) withString:@"*************"];
    }
    else {
        return self;
    }
}

- (NSString *)safeUserName {
    if (self.length > 1) {
        NSString *result = @"";
        for (int i=0; i<self.length-1; i++) {
            result = [result stringByAppendingString:@"*"];
        }
        result = [result stringByAppendingString:[self substringFromIndex:self.length-1]];
        return result;
    }
    else {
        return self;
    }
}

- (NSString *)fenToYuan {
    double fen = [self doubleValue];
    fen = fen / 100.0f;
    return [NSString stringWithFormat:@"%0.2f", fen];
}

- (NSString *)yuanToFen {
    double fen = [self doubleValue];
    fen = fen * 100.0f;
    return [NSString stringWithFormat:@"%0.0f", fen];
}

- (NSString *)bankCodeFormatWithBlankSep {
    NSMutableString *format = [[NSMutableString alloc] initWithCapacity:32];
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    for (int i = 0; i < str.length; i++) {
        if ( i != 0 && i % 4 == 0) {
            [format appendString:@" "];
        }
        [format appendFormat:@"%c", [str characterAtIndex:i]];
    }
    return format;
}

- (NSString *)percentEscapedString {
    static NSString * const kUPCharactersGeneralDelimitersToEncode = @":#[]@";
    static NSString * const kUPCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kUPCharactersGeneralDelimitersToEncode stringByAppendingString:kUPCharactersSubDelimitersToEncode]];
    static NSUInteger const batchSize = 50;
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    while (index < self.length) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wgnu"
        NSUInteger length = MIN(self.length - index, batchSize);
#pragma GCC diagnostic pop
        NSRange range = NSMakeRange(index, length);
        range = [self rangeOfComposedCharacterSequencesForRange:range];
        NSString *substring = [self substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        index += range.length;
    }
    return escaped;
}

- (NSString *)numStringTrim0 {
    NSRange range = [self rangeOfString:@"."];
    if (range.location != NSNotFound) {
        NSString *str = self;
        NSString *last = [str substringFromIndex:str.length - 1];
        while ([last isEqualToString:@"0"] || [last isEqualToString:@"."]) {
            str = [str substringToIndex:str.length - 1];
            if ([last isEqualToString:@"."]) {
                break;
            }
            last = [str substringFromIndex:str.length - 1];
        }
        return str;
    }
    else {
        return self;
    }
}

@end
