//
//  PPSplashViewController.m
//  PPLibrary
//
//  Created by Hieu Bui on 10/17/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPSplashViewController.h"
#import "PPLoginViewController.h"
#import "PPSignUpViewController.h"

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
    [self gotoLoginView];
}

- (IBAction)btnSignUpClicked:(id)sender {
    [self gotoSignUpView];
}

- (void)gotoLoginView
{
    PPLoginViewController *vc = [[[PPLoginViewController alloc] initWithNibName:@"PPLoginViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoSignUpView
{
    PPSignUpViewController *vc = [[[PPSignUpViewController alloc] initWithNibName:@"PPSignUpViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];    
}

@end
