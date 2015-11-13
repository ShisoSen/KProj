//
//  KATimeLineViewController.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/12.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KATimeLineViewController.h"
#import "KAUtility.h"
#import "KAUnitCell.h"
#import "KATimeLineView.h"

@interface KATimeLineViewController ()<KATimeLineViewDatasource,KATimeLineViewDelegate>
@property (nonatomic, strong) KATimeLineView *timeLineView;
@end

@implementation KATimeLineViewController{
    NSMutableArray *cellArr;
}
@synthesize timeLineView;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self loadData];
    }
    return self;
}
- (void)loadData{
    cellArr = [NSMutableArray array];
    KAUnitCell *cell1 = [KAUnitCell new];
    cell1.title = @"a boring day...";
    cell1.date = 2;
    cell1.emotionArr = @[@"happy",@"sad",@"nothing"];
    cell1.weather = KAWEATHERTYPE_RAIN;
    [cellArr addObject:cell1];
    KAUnitCell *cell2 = [KAUnitCell new];
    cell2.title = @"a boring day, too...";
    cell2.date = 3;
    cell2.emotionArr = @[@"happy",@"sad",@"nothing",@"happy",@"sad",@"nothing",@"happy",@"sad",@"nothing",@"happy",@"sad",@"nothing"];
    cell2.weather = KAWEATHERTYPE_SUN;
    [cellArr addObject:cell2];
    KAUnitCell *cell3 = [KAUnitCell new];
    cell3.title = @"a little funny day.";
    cell3.date = 4;
    cell3.emotionArr = @[@"happy",@"nothing"];
    cell3.weather = KAWEATHERTYPE_RAIN;
    [cellArr addObject:cell3];
    KAUnitCell *cell4 = [KAUnitCell new];
    cell4.title = @"happy day!";
    cell4.date = 5;
    cell4.emotionArr = @[@"happy",@"happy",@"nothing",@"happy"];
    cell4.weather = KAWEATHERTYPE_SUN;
    [cellArr addObject:cell4];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    timeLineView = [[KATimeLineView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    timeLineView.delegate = self;
    timeLineView.datasource = self;
    [self.view addSubview:timeLineView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -KATimeLine
- (CGFloat)timeLineView:(KATimeLineView *)timeLineView heightForIndex:(NSUInteger)index{
    return 90.0f;
}
- (KAUnitCell *)timeLineView:(KATimeLineView *)timeLineView unitCellForIndex:(NSUInteger)index{
    return cellArr[index];
}
- (NSUInteger)numberOfCellsInSectionInTimeLineView:(KATimeLineView *)timeLineView{
    return cellArr.count;
}
@end
