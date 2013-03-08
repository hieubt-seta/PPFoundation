//
//  PPBaseViewController.h
//  winner21
//
//  Created by Hieu Bui on 3/7/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"
#import "UINavigationController+MFSideMenu.h"
#import "PPAppDelegate.h"
#import "PPSession.h"
#import "MBProgressHUD.h"

@interface PPBaseViewController : UIViewController

@property (strong, nonatomic) PPAppDelegate *appDelegate;
@property (strong, nonatomic) PPSession *PP_SESSION;
@property (strong, nonatomic) MBProgressHUD *progressHUD;

- (void)registerNotifications;
- (void)unregisterNotifications;
- (void)showLoadingView;
- (void)showLoadingViewWithTitle:(NSString *)title;
- (void)hideLoadingView;
- (void)showMessage:(NSString *)message withTitle:(NSString *)title;
- (void)showMessage:(NSString *)message withTitle:(NSString *)title andDelegate:(id)delegate;
- (void)showMessage:(NSString *)message withTitle:(NSString *)title delegate:(id)delegate andTag:(NSInteger)tag;
- (void)showMessage:(NSString *)message withTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle delegate:(id)delegate andTag:(NSInteger)tag;

@end
