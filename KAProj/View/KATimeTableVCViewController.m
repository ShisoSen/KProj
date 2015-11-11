//
//  KATimeTableVCViewController.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/10.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KATimeTableVCViewController.h"
#import "KATimeTableCell.h"
#import "KAUtility.h"
#import "KAUnitCell.h"

static NSString *const kIDENTIFIER = @"IDENTIFIER";

@interface KATimeTableVCViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *timeTable;
@end

@implementation KATimeTableVCViewController{
    NSMutableArray *cellArr;
}
@synthesize timeTable;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self loadData];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    timeTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    timeTable.delegate = self;
    timeTable.dataSource = self;
    timeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:timeTable];
    [timeTable registerClass:[KATimeTableCell class] forCellReuseIdentifier:kIDENTIFIER];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - time table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==timeTable) {
        return cellArr.count;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KATimeTableCell *cell = [timeTable dequeueReusableCellWithIdentifier:kIDENTIFIER];
    cell.cell = cellArr[indexPath.row];
//    cell.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    if (indexPath.row%2==1) {
//        cell.edge.backgroundColor = [UIColor redColor];
//        cell.backgroundColor = [KAUtility colorWithHex:0xf3f3f3 alpha:1.0f];
//    }else{
//        cell.edge.backgroundColor = [UIColor blueColor];
//        cell.backgroundColor = [UIColor clearColor];
//    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==timeTable) {
        return [KATimeTableCell height4Cell:cellArr[indexPath.row]];
    }
    return 45;
}

//- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return features[section];
//    
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%s: %ld",__func__,indexPath.row);
}

@end
