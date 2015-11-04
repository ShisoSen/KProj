//
//  KAWeatherView.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/4.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KAWeatherView.h"

@implementation KAWeatherView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        label.text = @"123";
        label.center = self.center;
        [self addSubview:label];
    }
    return self;
}

@end
