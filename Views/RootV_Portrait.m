//
//  RootV_Portrait.m
//  KProj
//
//  Created by Sicong Qian on 15/10/20.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootV_Portrait.h"

@interface RootV_Portrait ()

@end

@implementation RootV_Portrait{
    UINavigationBar *navBar;
    UINavigationItem *navItems;
    UIBarButtonItem *rightItemDel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 69)];
    [navBar setBarTintColor:[UIColor colorWithRed:0.241 green:0.474 blue:1.000 alpha:1.000]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navBar.translucent = false;
    [self.view addSubview:navBar];
    
    navItems = [[UINavigationItem alloc] initWithTitle:@"xxxxx"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(MenuAction:)];
    [leftItem setTintColor:[UIColor whiteColor]];
    navItems.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"A" style:UIBarButtonItemStylePlain target:self action:@selector(AddAction:)];
    [rightItem setTintColor:[UIColor whiteColor]];
    rightItemDel = [[UIBarButtonItem alloc] initWithTitle:@"D" style:UIBarButtonItemStylePlain target:self action:@selector(DeleteAction:)];
    [rightItemDel setTintColor:[UIColor whiteColor]];
    navItems.rightBarButtonItems = @[rightItemDel,rightItem];
    [navBar pushNavigationItem:navItems animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
