//
//  KAEmotionView.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/4.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KAEmotionView.h"

static const int kThreshold = 5;
@interface KAPoint : NSObject
@property (nonatomic,assign) CGPoint point;
@end
@implementation KAPoint


@end

@implementation KAEmotionView{
    NSMutableArray *pointArr;
    UIPanGestureRecognizer *panGesture;
    UILabel *emotionLabel;
}
@synthesize panAble;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        pointArr = [NSMutableArray array];
        panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
        emotionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        emotionLabel.center = self.center;
        [self addSubview:emotionLabel];
    }
    return self;
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)recognizer{
    CGPoint offset = [recognizer translationInView:self];
    NSLog(@"offset: %f, %f",offset.x,offset.y);
    if ((recognizer.state==UIGestureRecognizerStateBegan)||
        (recognizer.state==UIGestureRecognizerStateChanged)) {
        KAPoint *point = [[KAPoint alloc] init];
        point.point = offset;
        [pointArr addObject:point];
    }else if(recognizer.state==UIGestureRecognizerStateEnded){
        KAPoint *point = [[KAPoint alloc] init];
        point.point = offset;
        [pointArr addObject:point];
        [self calculatePointPath2Emotion:pointArr];
    }

}

- (KAEMOTIONTYPE)calculatePointPath2Emotion:(NSArray*)arr{
    float tanArr[100];
    int index = 0;
    KAPoint *old;
    for (KAPoint *point in arr) {
        if (!old) {
            old = point;
            continue;
        }
        CGFloat x = point.point.x - old.point.x;
        CGFloat y = point.point.y - old.point.y;
        if (y!=0) {
            CGFloat tan = x/y;
            if (index<101) {
                tanArr[index] = tan;
                index++;
            }
            NSLog(@"tan: %f",tan);
        }else{
            NSLog(@"000000");
        }
        
    }
    [pointArr removeAllObjects];
    int count = 0;
    for (int i=0; i<100; i++) {
        
    }
    return KAEMOTIONTYPE_COMMON;
}

- (void)setPanAble:(BOOL)p{
    panAble = p;
    [self resetPanGesture:panAble];
}
- (void)resetPanGesture:(BOOL)NA{
    if (NA) {
        [self addGestureRecognizer:panGesture];
    }else{
        [self removeGestureRecognizer:panGesture];
    }
}
@end
