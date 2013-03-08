//
//  PPBaseViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/7/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPBaseViewController.h"

@interface PPBaseViewController ()

@end

@implementation PPBaseViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        [self customInitialization];        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        [self customInitialization];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self customInitialization];
    }
    return self;
}

- (void)customInitialization
{
    self.PP_SESSION = [PPSession sharedPPSession];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PPAppDelegate *)appDelegate
{
    return (PPAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)registerNotifications
{
    // Optional
}

- (void)unregisterNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
