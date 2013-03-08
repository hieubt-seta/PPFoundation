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

@interface PPBaseViewController : UIViewController

@property (strong, nonatomic) PPAppDelegate *appDelegate;
@property (assign, nonatomic) PPSession *PP_SESSION;

- (void)registerNotifications;
- (void)unregisterNotifications;

@end
