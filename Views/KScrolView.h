//
//  KKScrolView.h
//  KProj
//
//  Created by Sicong Qian on 15/10/22.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface KAbstractDotView : UIView
- (void)changeActivityState:(BOOL)active;
@end
@interface KScrolView : UIView
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *dotViews;
@property (nonatomic, strong) NSArray<UIView*> *containerViewArr;
@property (nonatomic) Class dotViewClass;
@property (nonatomic, assign) CGSize dotSize;
@end
