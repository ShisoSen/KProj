//
//  KKScrolView.m
//  KProj
//
//  Created by Sicong Qian on 15/10/22.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KScrolView.h"

@implementation KAbstractDotView
- (id)init{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}
- (void)changeActivityState:(BOOL)active{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}
@end

@interface KAnimatedDotView : KAbstractDotView

@end
static CGFloat const kAnimateDuration = 1;

@implementation KAnimatedDotView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}
- (void)initialization{
    self.backgroundColor    = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.layer.borderWidth  = 2;
}
- (void)changeActivityState:(BOOL)active{
    if (active) {
        [self animateToActiveState];
    } else {
        [self animateToDeactiveState];
    }
}
- (void)animateToActiveState{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor whiteColor];
        self.transform = CGAffineTransformMakeScale(1.4, 1.4);
    } completion:nil];
}
- (void)animateToDeactiveState{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}
@end

const float kDotViewSpacing = 8;
@interface KScrolView ()<UIScrollViewDelegate>

@end
@implementation KScrolView{
    NSMutableArray<KAbstractDotView*> *dotArr;
    NSInteger currentPageIndex;
}
@synthesize scrollView,containerViewArr,dotViewClass,dotViews,dotSize;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setUpScrollView];
    }
    return self;
}
- (void)_setUpScrollView{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    [self addSubview:scrollView];
    
}

- (void)setContainerViewArr:(NSArray<UIView *> *)arr{
    containerViewArr = arr;
    [self _updateScrollView];
}
- (void)_updateScrollView{
    if (containerViewArr) {
        scrollView.contentSize = CGSizeMake(self.frame.size.width*containerViewArr.count, self.frame.size.height);
        int i = 0;
        for (UIView *view in containerViewArr) {
            view.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
            [scrollView addSubview:view];
            i++;
        }
    }
    [self _setUpDotView];
}
- (void)_setUpDotView{
    if (dotViewClass) {
#warning TO-DO customer dotView
        dotViews = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dotSize.width*containerViewArr.count, dotSize.height)];
    }else{
        dotArr = [NSMutableArray array];
        float dotViewWidth = (dotSize.width+kDotViewSpacing)*containerViewArr.count-kDotViewSpacing;
        float startPointX = (self.frame.size.width-dotViewWidth)/2;
        for (int i=0; i<containerViewArr.count; i++) {
            KAnimatedDotView *dotView = [[KAnimatedDotView alloc] initWithFrame:CGRectMake(startPointX+(dotSize.width+kDotViewSpacing)*i, self.frame.size.height-dotSize.height-5, dotSize.width, dotSize.height)];
            [dotArr addObject:dotView];
            [self addSubview:dotView];
        }
        
    }
    if (dotArr&&dotArr.count>0) {
        currentPageIndex = 0;
        [self updateDotAtIndex:currentPageIndex withState:YES];
    }
}
- (void)updateDotAtIndex:(NSInteger)index withState:(BOOL)state{
    KAnimatedDotView *dotView = (KAnimatedDotView*)dotArr[index];
    [dotView changeActivityState:state];
    
}
#pragma mark -scrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView_{
    NSInteger pageIndex = scrollView_.contentOffset.x / CGRectGetWidth(scrollView_.frame);
    if (pageIndex==currentPageIndex) {
        return;
    }else{
        [self updateDotAtIndex:currentPageIndex withState:NO];
        currentPageIndex = pageIndex;
        [self updateDotAtIndex:currentPageIndex withState:YES];
    }
}
@end
