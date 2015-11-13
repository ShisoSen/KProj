//
//  KATimeLineView.h
//  KAProj
//
//  Created by Sicong Qian on 15/11/12.
//  Copyright © 2015年 silverup.co. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "KAUnitCell.h"
@class KATimeLineView;

@protocol KATimeLineViewDatasource <NSObject>
- (CGFloat)timeLineView:(KATimeLineView*) timeLineView heightForIndex:(NSUInteger)index;
- (KAUnitCell*)timeLineView:(KATimeLineView*) timeLineView unitCellForIndex:(NSUInteger)index;
- (NSUInteger)numberOfCellsInSectionInTimeLineView:(KATimeLineView*) timeLineView;

@end
@protocol KATimeLineViewDelegate <NSObject>

@end


@interface KATimeLineView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) id<KATimeLineViewDatasource> datasource;
@property (nonatomic, weak) id<KATimeLineViewDelegate> delegate;

@end
