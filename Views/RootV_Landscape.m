//
//  RootV_Landscape.m
//  KProj
//
//  Created by Sicong Qian on 15/10/20.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootV_Landscape.h"

@interface RootV_Landscape ()

@end

@implementation RootV_Landscape

- (void)viewDidLoad {
    p_FuncName
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.center = self.view.center;
    label.text = @"XXXXXXXXXX";
    [self.view addSubview:label];
}

- (void)viewDidAppear:(BOOL)animated{
    p_FuncName
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}
@end
