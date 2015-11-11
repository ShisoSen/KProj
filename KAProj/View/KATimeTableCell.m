//
//  KATimeTableCell.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/11.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KATimeTableCell.h"
#import "KAUtility.h"
static const CGFloat kLineLeading = 50.0f;
static const CGFloat kCenterImageHeight = 30.0f;
static const CGFloat kViewTop = 8.0f;
static const CGFloat kTimeLabelWidth = 10.0f;
static const CGFloat kSpacing = 5.0f;
static const CGFloat kEmotionViewHeight = 40.0f;
static const CGFloat kEmotionSpacing = 2.0f;

@implementation KATimeTableCell
@synthesize edge,line,centerImage,timeLabel,textLabel,emotionView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _setUp];
    }
    return self;
}
- (void)_setUp{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    edge = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, self.bounds.size.height)];
    edge.backgroundColor = [KAUtility colorWithHex:0x5190fa alpha:1.0];
    [self addSubview:edge];
    line = [[UIView alloc] initWithFrame:CGRectMake(kLineLeading, 0, 1, self.bounds.size.height)];
    line.backgroundColor = [KAUtility colorWithHex:0xd6dcdc alpha:1.0];
    [self addSubview:line];
    centerImage = [[UIImageView alloc] initWithFrame:CGRectMake(kLineLeading-kCenterImageHeight/2, kViewTop, kCenterImageHeight, kCenterImageHeight)];
    [self addSubview:centerImage];
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLineLeading-kCenterImageHeight/2-kSpacing-kTimeLabelWidth, kViewTop, kTimeLabelWidth, kCenterImageHeight)];
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.text = @"1";
    [self addSubview:timeLabel];
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLineLeading+kCenterImageHeight/2+kSpacing, kViewTop, self.bounds.size.width-kLineLeading-kCenterImageHeight/2-kSpacing*2, kCenterImageHeight)];
    textLabel.text = @"123456";
    [self addSubview:textLabel];
    emotionView = [[UIView alloc] initWithFrame:CGRectMake(kLineLeading+kCenterImageHeight/2+kSpacing, kViewTop+kCenterImageHeight, self.bounds.size.width-kLineLeading-kCenterImageHeight/2-kSpacing*2, kCenterImageHeight)];
    [self addSubview:emotionView];
    emotionView.backgroundColor = [KAUtility colorWithHex:0xc6c6c6 alpha:1.0f];
}

- (void)setCell:(KAUnitCell *)cell{
    _cell = cell;
    [self _updateCellContent];
    
}
- (void)_updateCellContent{
    textLabel.text = self.cell.title;
    timeLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.cell.date];
    UIImage *image;
    switch (self.cell.weather) {
        case KAWEATHERTYPE_SUN:
        edge.backgroundColor = [KAUtility colorWithHex:0x5190fa alpha:1.0f];
        image = [UIImage imageNamed:@"weather_rain"];
        break;
        case KAWEATHERTYPE_RAIN:
        edge.backgroundColor = [KAUtility colorWithHex:0x91d02a alpha:1.0f];
        image = [UIImage imageNamed:@"weather_rain"];
        break;
        default:
        break;
    }
    if (image) {
        centerImage.contentMode = UIViewContentModeScaleAspectFill;
        centerImage.image = image;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    NSLog(@"%s",__func__);
}

- (void)layoutSubviews{
    NSLog(@"%s",__func__);
    edge.frame = CGRectMake(0, 0, 3, self.bounds.size.height);
    line.frame = CGRectMake(kLineLeading, 0, 1, self.bounds.size.height);
    emotionView.frame = CGRectMake(kLineLeading+kCenterImageHeight/2+kSpacing, kViewTop+kCenterImageHeight, self.bounds.size.width-kLineLeading-kCenterImageHeight/2-kSpacing*2, [KATimeTableCell height4Cell:self.cell]-45);
}

+ (CGFloat)height4Cell:(KAUnitCell*)cell{
    CGFloat unitWidth = kEmotionViewHeight+kEmotionSpacing;
    int unitNum = floor(([UIScreen mainScreen].bounds.size.width-kLineLeading-kCenterImageHeight/2-kSpacing*2)/unitWidth);
    int row = ceil((double)cell.emotionArr.count/unitNum);
    return 45+row*(kEmotionViewHeight+kSpacing)-((row>1)?kSpacing:0);
}
@end
