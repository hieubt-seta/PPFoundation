//
//  PPSignUpViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPSignUpViewController.h"

@interface PPSignUpViewController ()

@end

@implementation PPSignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = LSSTRING(@"Sign Up");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSignUpClicked:(id)sender {
    [self.progressHUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        self.PP_SESSION.isAuthenticated = NO;
        [self.appDelegate showRaceMeetingView];
    }];
}

@end
