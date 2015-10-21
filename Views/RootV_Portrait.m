//
//  RootV_Portrait.m
//  KProj
//
//  Created by Sicong Qian on 15/10/20.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "RootV_Portrait.h"
#import "KScrollViewController.h"

const float kScrollViewHeight = 300.0;
@interface RootV_Portrait ()

@end

@implementation RootV_Portrait{
    UINavigationBar *navBar;
    UINavigationItem *navItems;
    UIBarButtonItem *rightItemDel;
    KScrollViewController *kScrollVC;
    
    NSMutableArray<UIView*> *viewArr;
    NSArray *imagesData;
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
    
    [self _loadData];
    [self _setUpViews];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    kScrollVC.view.frame = CGRectMake(0, 70, self.view.frame.size.width, kScrollViewHeight);
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
    kScrollVC = [[KScrollViewController alloc] initWithContainerFrame:CGRectMake(0, 70, self.view.frame.size.width, kScrollViewHeight)];
    kScrollVC.dotSize = CGSizeMake(12, 12);
    kScrollVC.containerViewArr = viewArr;
    [self addChildViewController:kScrollVC];
    [self.view addSubview:kScrollVC.view];
    [kScrollVC didMoveToParentViewController:self];
    
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
