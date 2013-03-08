//
//  PPAppDelegate.h
//  PPLibrary
//
//  Created by Hieu Bui on 10/17/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSplashViewController;
@class PPRaceMeetingsController;
@class PPSideMenuViewController;
@class MFSideMenu;

@interface PPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PPRaceMeetingsController *mainViewController;
@property (strong, nonatomic) MFSideMenu *sideMenu;

- (void)showSplashView;
- (void)showRaceMeetingView;

@end
