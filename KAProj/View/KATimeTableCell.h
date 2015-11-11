//
//  KATimeTableCell.h
//  KAProj
//
//  Created by Sicong Qian on 15/11/11.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KAUnitCell.h"

@interface KATimeTableCell : UITableViewCell
@property (nonatomic, strong) UIView *edge;
@property (nonatomic, strong) UIImageView *centerImage;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *emotionView;
@property (nonatomic, strong) UIView *textView;
@property (nonatomic, strong) KAUnitCell *cell;

+ (CGFloat)height4Cell:(KAUnitCell*)cell;
@end
