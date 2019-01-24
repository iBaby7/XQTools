//
//  XQMacro+Color.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#ifndef XQMacro_Color_h
#define XQMacro_Color_h

#define RGB(R,G,B)               [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
#define RGBA(R,G,B,A)            [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#endif /* XQMacro_Color_h */
