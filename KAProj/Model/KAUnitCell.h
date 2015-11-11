//
//  KAUnitCell.h
//  KAProj
//
//  Created by Sicong Qian on 15/11/11.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, KAWEATHERTYPE){
    KAWEATHERTYPE_SUN,
    KAWEATHERTYPE_RAIN
};

@interface KAUnitCell : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSUInteger date;
@property (nonatomic, assign) KAWEATHERTYPE weather;
@property (nonatomic, copy) NSArray *emotionArr;
@end
