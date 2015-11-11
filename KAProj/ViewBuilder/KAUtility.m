//
//  KAUtility.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/11.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KAUtility.h"

@implementation KAUtility

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}
@end
