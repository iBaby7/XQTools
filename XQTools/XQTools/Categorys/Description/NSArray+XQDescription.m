//
//  NSArray+XQDescription.m
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#import "NSArray+XQDescription.h"
#import "NSString+XQFormat.h"

@implementation NSArray (XQDescription)

- (NSString *)description {
    return [self xq_descriptionWithLevel:1];
}

-(NSString *)descriptionWithLocale:(id)locale {
    return [self xq_descriptionWithLevel:1];
}

- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [self xq_descriptionWithLevel:(int)level];
}

/**
 将数组转化成字符串，文字格式UTF8,并且格式化
 
 @param level 当前数组的层级，最少为 1，代表最外层
 @return 格式化的字符串
 */
- (NSString *)xq_descriptionWithLevel:(int)level {
    NSString *subSpace = [self xq_getSpaceWithLevel:level];
    NSString *space = [self xq_getSpaceWithLevel:level - 1];
    NSMutableString *retString = [[NSMutableString alloc] init];
    // 1、添加 [
    [retString appendString:[NSString stringWithFormat:@"["]];
    // 2、添加 value
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *value = (NSString *)obj;
            value = value.percentEscapedString;
            NSString *subString = [NSString stringWithFormat:@"\n%@\"%@\",", subSpace, value];
            [retString appendString:subString];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            NSArray *arr = (NSArray *)obj;
            NSString *str = [arr xq_descriptionWithLevel:level + 1];
            str = [NSString stringWithFormat:@"\n%@%@,", subSpace, str];
            [retString appendString:str];
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)obj;
            NSString *str = [dic descriptionWithLocale:nil indent:level + 1];
            str = [NSString stringWithFormat:@"\n%@%@,", subSpace, str];
            [retString appendString:str];
        } else {
            NSString *subString = [NSString stringWithFormat:@"\n%@%@,", subSpace, obj];
            [retString appendString:subString];
        }
    }];
    if ([retString hasSuffix:@","]) {
        [retString deleteCharactersInRange:NSMakeRange(retString.length-1, 1)];
    }
    // 3、添加 ]
    [retString appendString:[NSString stringWithFormat:@"\n%@]", space]];
    return retString;
}


/**
 根据层级，返回前面的空格占位符
 
 @param level 层级
 @return 占位空格
 */
- (NSString *)xq_getSpaceWithLevel:(int)level {
    NSMutableString *mustr = [[NSMutableString alloc] init];
    for (int i=0; i<level; i++) {
        [mustr appendString:@"\t"];
    }
    return mustr;
}

@end
