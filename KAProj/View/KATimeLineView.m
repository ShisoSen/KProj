//
//  KATimeLineView.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/12.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KATimeLineView.h"
//line
static const CGFloat kLineLeading = 50.0f;
static const CGFloat kLineTop = 100.0f;
static const CGFloat kLineAngle = M_PI/3;
static const CGFloat kUnitLineWidth = 90.0f;
//cell
static const CGFloat kUnitCellWidth = 150.0f;

@interface KATimeLineView() <UIScrollViewDelegate>
@property (nonatomic, strong) UIView *line;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) NSUInteger currentIndex;
@end

@implementation KATimeLineView{
    NSMutableArray *showCellArr;
    NSMutableArray *reUseCellArr;
}
@synthesize scrollView,datasource,delegate,count,currentIndex,line;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setUp];
    }
    return self;
}

- (void)_setUp{
    currentIndex = 0;
    showCellArr = [NSMutableArray array];
    reUseCellArr = [NSMutableArray array];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    [self addSubview:scrollView];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width-2*kLineLeading)/cos(kLineAngle), 2)];
    line.layer.anchorPoint = CGPointZero;
    line.layer.position = CGPointMake(kLineLeading, kLineTop);
    line.layer.transform = CATransform3DMakeRotation(kLineAngle, 0, 0, 1);
    line.backgroundColor = [UIColor redColor];
    [self addSubview:line];
    
}
- (void)setDelegate:(id<KATimeLineViewDelegate>)delegate_{
    delegate = delegate_;
}
- (void)setDatasource:(id<KATimeLineViewDatasource>)datasource_{
    datasource = datasource_;
    [self loadSubviewFromDatasource];
}

- (void)loadSubviewFromDatasource{
    if ([datasource respondsToSelector:@selector(numberOfCellsInSectionInTimeLineView:)]&&[datasource respondsToSelector:@selector(timeLineView:unitCellForIndex:)]) {
    }else{
        NSAssert(1, @"Need to implement datasource!");
    }
    count = [datasource numberOfCellsInSectionInTimeLineView:self];
    
    CGFloat maxLength = (self.frame.size.width-kLineLeading)/cos(kLineAngle);
    
    BOOL inBounds = true;
    while (inBounds&&currentIndex<count) {
        KAUnitCell *cell = [datasource timeLineView:self unitCellForIndex:currentIndex++];
        CGFloat unitLineWidth = kUnitLineWidth/cos(kLineAngle);
        UIView *unitLine = [[UIView alloc] initWithFrame:CGRectMake(0+unitLineWidth*(currentIndex-1), 0, unitLineWidth, 2)];
        if (currentIndex%2==1) {
            unitLine.backgroundColor = [UIColor blueColor];
        }
        [line addSubview:unitLine];
        //showCell add
        UIView *showCell = [[UIView alloc] initWithFrame:CGRectMake(currentIndex*kUnitLineWidth, currentIndex*kUnitLineWidth*tan(kLineAngle)+kLineTop, kUnitCellWidth+kUnitLineWidth, kUnitLineWidth*tan(kLineAngle))];
        UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(kUnitCellWidth/2, kUnitCellWidth*tan(kLineAngle)/2,50, 50)];
        dot.backgroundColor = [UIColor blackColor];
        [showCell addSubview:dot];
        [self addSubview:showCell];
        [showCellArr addObject:showCell];
        CGFloat currentLength = currentIndex*kUnitLineWidth/cos(kLineAngle);
        if (currentLength>maxLength) {
            inBounds = NO;
        }
    }
    //scrollView contentSize
    CGFloat scrollWidth = count*kUnitLineWidth+2*kLineLeading;
    scrollView.contentSize = CGSizeMake(scrollWidth, self.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scroll{
    NSLog(@"scrollView offset.x: %f",scrollView.contentOffset.x);
    line.layer.position = CGPointMake(kLineLeading-scrollView.contentOffset.x, kLineTop-scrollView.contentOffset.x*tan(kLineAngle));
    for (UIView *cell in showCellArr) {
        cell.frame = CGRectMake(cell.frame.origin.x-scrollView.contentOffset.x, cell.frame.origin.y-scrollView.contentOffset.x*tan(kLineAngle), cell.frame.size.width, cell.frame.size.height);
    }
}
@end
