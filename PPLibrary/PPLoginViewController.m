//
//  PPLoginViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPLoginViewController.h"

@interface PPLoginViewController ()

@end

@implementation PPLoginViewController

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
    self.title = LSSTRING(@"Login");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginClicked:(id)sender
{
    [self.progressHUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        self.PPSESSION.isAuthenticated = YES;
        [self.appDelegate showRaceMeetingView];
    }];
}

- (void)dealloc {
    [_txtEmail release];
    [_txtPassword release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setTxtEmail:nil];
    [self setTxtPassword:nil];
    [super viewDidUnload];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

@end
