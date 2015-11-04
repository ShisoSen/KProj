//
//  KARootVC.m
//  KAProj
//
//  Created by Sicong Qian on 15/11/4.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "KARootVC.h"
#import "KAViewBuilder.h"

@interface KARootVC ()

@end

@implementation KARootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *body = [KAViewBuilder buildeView4KARootVC];
    [self.view addSubview:body];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
