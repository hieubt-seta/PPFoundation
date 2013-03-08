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

typedef enum {
    PPOpenAppFromBackgroundState        =       0,
    PPOpenAppFromClosedState            =       1,
    PPOpenAppFromInitializeState        =       2,
} PPOpenAppFromState;

@interface PPAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, assign) PPOpenAppFromState appOpenFromState;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PPRaceMeetingsController *mainViewController;
@property (strong, nonatomic) MFSideMenu *sideMenu;

- (void)showSplashView;
- (void)showRaceMeetingView;

@end
