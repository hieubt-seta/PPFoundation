//
//  PPAppDelegate.h
//  PPLibrary
//
//  Created by Hieu Bui on 10/17/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSplashViewController;
@class PPMainViewController;
@class PPSideMenuViewController;
@class MFSideMenu;

@interface PPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PPSplashViewController *splashViewController;
@property (strong, nonatomic) PPSideMenuViewController *sideMenuViewController;
@property (strong, nonatomic) PPMainViewController *mainViewController;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) MFSideMenu *sideMenu;

- (void)showSplashView;
- (void)showMainView;

@end
