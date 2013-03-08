//
//  PPSplashViewController.m
//  PPLibrary
//
//  Created by Hieu Bui on 10/17/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPSplashViewController.h"

@interface PPSplashViewController ()

@end

@implementation PPSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginClicked:(id)sender {
    [self.appDelegate showMainView];
    [self.PP_SESSION setIsAuthenticated:YES];
}

@end
