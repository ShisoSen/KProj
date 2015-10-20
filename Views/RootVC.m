//
//  RootVC.m
//  KProj
//
//  Created by Sicong Qian on 15/10/19.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootVC.h"
#import "RootV_Portrait.h"
#import "RootV_Landscape.h"

@interface RootVC ()

@end

@implementation RootVC{
    UIViewController *landscapeV;
    UIViewController *portraitV;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self switchOrientationView];
}

- (void)switchOrientationView{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    NSLog(@"orientation: %ld",(long)orientation);
    p_FuncName
    switch (orientation) {
        case UIDeviceOrientationLandscapeRight:
        case UIDeviceOrientationLandscapeLeft:
            if (!landscapeV) {
                landscapeV = [[RootV_Landscape alloc] init];
            }
            if (portraitV) {

                [portraitV.view removeFromSuperview];
                [portraitV removeFromParentViewController];
            }
            [self addChildViewController:landscapeV];
            landscapeV.view.frame = self.view.frame;
            [self.view addSubview:landscapeV.view];
            [landscapeV didMoveToParentViewController:self];
            break;
        case UIDeviceOrientationPortrait:
            if (!portraitV) {
                portraitV = [[RootV_Portrait alloc] init];
            }
            if (landscapeV) {
                [landscapeV.view removeFromSuperview];
                [landscapeV removeFromParentViewController];
            }
            [self addChildViewController:portraitV];
            portraitV.view.frame = self.view.frame;
            [self.view addSubview:portraitV.view];
            [portraitV didMoveToParentViewController:self];
            break;
        default:
            break;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    p_FuncName
    [self switchOrientationView];
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
- (BOOL)shouldAutorotate{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
