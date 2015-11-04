//
//  KAEmotionView.h
//  KAProj
//
//  Created by Sicong Qian on 15/11/4.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,KAEMOTIONTYPE){
    KAEMOTIONTYPE_SMILE,
    KAEMOTIONTYPE_LAUGH,
    KAEMOTIONTYPE_COMMON
};

@interface KAEmotionView : UIView

@property (nonatomic, assign) BOOL panAble;
@end
