//
//  PPAppDelegate.m
//  PPLibrary
//
//  Created by Hieu Bui on 10/17/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPAppDelegate.h"
#import "PPSplashViewController.h"
#import "PPSideMenuViewController.h"
#import "PPRaceMeetingsController.h"

@interface PPAppDelegate (Privates)

@end

@implementation PPAppDelegate

- (PPSplashViewController *)splashViewController
{
    if (!_splashViewController) {
        _splashViewController = [[PPSplashViewController alloc] initWithNibName:@"PPSplashViewController" bundle:nil];
    }
    return _splashViewController;
}

- (PPSideMenuViewController *)sideMenuViewController
{
    if (!_sideMenuViewController) {
        _sideMenuViewController = [[PPSideMenuViewController alloc] initWithNibName:@"PPSideMenuViewController" bundle:nil];
    }
    return _sideMenuViewController;
}

- (PPRaceMeetingsController *)mainViewController
{
    if (!_mainViewController) {
        _mainViewController = [[PPRaceMeetingsController alloc] initWithNibName:@"PPRaceMeetingsController" bundle:nil];
    }
    return _mainViewController;
}

- (UINavigationController *)navigationController
{
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    }
    return _navigationController;
}

// Show Splash View
- (void)showSplashView
{
    self.window.rootViewController = self.splashViewController;
}

// Show Main View
- (void)showMainView
{
    self.sideMenu = [MFSideMenu menuWithNavigationController:self.navigationController
                      leftSideMenuController:self.sideMenuViewController
                     rightSideMenuController:nil];
    self.window.rootViewController = self.navigationController;
}

- (void)dealloc
{
    [_window release];
    [_sideMenuViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    
    [self showSplashView];
    [self.window makeKeyAndVisible];
    
    return YES;
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
