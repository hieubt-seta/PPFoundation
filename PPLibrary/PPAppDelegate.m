//
//  PPAppDelegate.m
//  PPLibrary
//
//  Created by Hieu Bui on 10/17/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPAppDelegate.h"
#import "PPSettingsManager.h"
#import "PPSplashViewController.h"
#import "PPSideMenuViewController.h"
#import "PPRaceMeetingsController.h"
#import "PPMacros.h"

@interface PPAppDelegate()
{
    BOOL _isFirstTimeShowingSplash;
}
@end

@implementation PPAppDelegate

- (PPRaceMeetingsController *)mainViewController
{
    if (!_mainViewController) {
        _mainViewController = [[PPRaceMeetingsController alloc] initWithNibName:@"PPRaceMeetingsController" bundle:nil];
    }
    return _mainViewController;
}

// Show Splash View
- (void)showSplashView
{
    PPSplashViewController *vc = [[[PPSplashViewController alloc] initWithNibName:@"PPSplashViewController" bundle:nil] autorelease];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    if (_isFirstTimeShowingSplash) {
        _isFirstTimeShowingSplash = NO;
        if ([self.sideMenu.navigationController respondsToSelector:@selector(presentViewController:animated:completion:)]) {
            [self.sideMenu.navigationController presentViewController:nav animated:NO completion:nil];
        } else {
            [self.sideMenu.navigationController presentModalViewController:nav animated:NO];
        }
    
    } else {
        if ([self.sideMenu.navigationController respondsToSelector:@selector(presentViewController:animated:completion:)]) {
            [self.sideMenu.navigationController presentViewController:nav animated:YES completion:nil];
        } else {
            [self.sideMenu.navigationController presentModalViewController:nav animated:YES];
        }
    }
}

// Show Main View
- (void)showRaceMeetingView
{
    if ([self.sideMenu.navigationController respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self.sideMenu.navigationController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.sideMenu.navigationController dismissModalViewControllerAnimated:YES];
    }
}

- (void)dealloc
{
    [_mainViewController release];
    [_sideMenu release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    _isFirstTimeShowingSplash = YES;
    
    [self addObserver:self forKeyPath:@"appOpenFromState" options:NSKeyValueObservingOptionInitial context:nil];
    
    if ([[PPSettingsManager sharedPPSettingsManager] isFirstTimeOpenApp]) {
        [[PPSettingsManager sharedPPSettingsManager] setIsFirstTimeOpenApp:NO];
        self.appOpenFromState = PPOpenAppFromInitializeState;
    } else {
        self.appOpenFromState = PPOpenAppFromClosedState;
    }
    
    // Setup SideMenu
    self.sideMenu = [MFSideMenu menuWithNavigationController:[[[UINavigationController alloc] initWithRootViewController:self.mainViewController] autorelease]
                                      leftSideMenuController:[[[PPSideMenuViewController alloc] initWithNibName:@"PPSideMenuViewController" bundle:nil] autorelease]
                                     rightSideMenuController:nil];
    
    self.window.rootViewController = self.sideMenu.navigationController;
    [self.window makeKeyAndVisible];
    [self showSplashView];
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kAppOpenFromStateDidChangeNotification object:[NSNumber numberWithInteger:self.appOpenFromState]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    self.appOpenFromState = PPOpenAppFromBackgroundState;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
