//
//  KAViewBuilder.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/4.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KAViewBuilder.h"
#import "KARootMainView.h"
#import "KAWeatherView.h"
#import "KAEmotionView.h"

@implementation KAViewBuilder

+ (UIView*)buildeView4KARootVC{
    KARootMainView *mainView = [[KARootMainView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    KAWeatherView *weatherView = [[KAWeatherView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    KAEmotionView *emotionView = [[KAEmotionView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    emotionView.panAble = YES;
    [mainView addSubview:weatherView];
    [mainView addSubview:emotionView];
    return mainView;
}
@end
