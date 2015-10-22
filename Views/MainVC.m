//
//  MainVC.m
//  KProj
//
//  Created by Sicong Qian on 15/10/22.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "MainVC.h"
#import "KScrolView.h"

@interface MainVC ()

@end
const float kScrollViewHeight = 300.0;

@implementation MainVC{
    UINavigationItem *navItems;
    UIBarButtonItem *rightItemDel;
    KScrolView *kScrollView;
    
    NSMutableArray<UIView*> *viewArr;
    NSArray *imagesData;
}
@synthesize navigationBar,galleryView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self _loadData];
    [self _setUpViews];
}
- (void)_loadData{
    imagesData = @[@"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg", @"image5.jpg", @"image6.jpg"];
    viewArr = [NSMutableArray array];
    [imagesData enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL *stop) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kScrollViewHeight)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:imageName];
        imageView.clipsToBounds = YES;
        [viewArr addObject:imageView];
    }];
}
- (void)_setUpViews{
    kScrollView = [[KScrolView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kScrollViewHeight)];
    kScrollView.dotSize = CGSizeMake(12, 12);
    kScrollView.containerViewArr = viewArr;
    [galleryView addSubview:kScrollView];
    
}
- (void)_updateNavigationBarIsPortrait:(BOOL)isP{
    if (!isP) {
        if (navigationBar) {
            [navigationBar setHidden:YES];
        }
    }else{
        if (navigationBar) {
            [navigationBar setHidden:NO];
        }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
#pragma clang diagnostic pop
            navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 69)];
            [navigationBar setBarTintColor:[UIColor colorWithRed:0.241 green:0.474 blue:1.000 alpha:1.000]];
            [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            navigationBar.translucent = false;
            [self.view addSubview:navigationBar];
            
            navItems = [[UINavigationItem alloc] initWithTitle:@"xxxxx"];
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(MenuAction:)];
            [leftItem setTintColor:[UIColor whiteColor]];
            navItems.leftBarButtonItem = leftItem;
            UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"A" style:UIBarButtonItemStylePlain target:self action:@selector(AddAction:)];
            [rightItem setTintColor:[UIColor whiteColor]];
            rightItemDel = [[UIBarButtonItem alloc] initWithTitle:@"D" style:UIBarButtonItemStylePlain target:self action:@selector(DeleteAction:)];
            [rightItemDel setTintColor:[UIColor whiteColor]];
            navItems.rightBarButtonItems = @[rightItemDel,rightItem];
            [navigationBar pushNavigationItem:navItems animated:YES];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    switch (orientation) {
        case UIDeviceOrientationLandscapeRight:
        case UIDeviceOrientationLandscapeLeft:
            [self _updateNavigationBarIsPortrait:NO];
            break;
        case UIDeviceOrientationPortrait:
            [self _updateNavigationBarIsPortrait:YES];
            break;
        default:
            break;
    }

    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
