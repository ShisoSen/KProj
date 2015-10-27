//
//  MainVC.h
//  KProj
//
//  Created by Sicong Qian on 15/10/22.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController
@property (strong, nonatomic) UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIView *galleryView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
