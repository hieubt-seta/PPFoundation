//
//  PPSignUpViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPSignUpViewController.h"

@interface PPSignUpViewController ()
{
    BOOL _isShowingKeyboard;
}

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
    [self registerForKeyboardNotifications];
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    if (_isShowingKeyboard) {
        return;
    }
    _isShowingKeyboard = YES;
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect frame = self.scrollView.frame;
    frame.size.height -= kbSize.height;
    self.scrollView.frame = frame;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    _isShowingKeyboard = NO;
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect frame = self.scrollView.frame;
    frame.size.height += kbSize.height;
    self.scrollView.frame = frame;
    self.scrollView.contentOffset = CGPointZero;
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
        self.PPSESSION.isAuthenticated = NO;
        [self.appDelegate showRaceMeetingView];
    }];
}

- (void)dealloc {
    [_scrollView release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self unregisterForKeyboardNotifications];
    [self setScrollView:nil];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.scrollView.contentSize = self.scrollView.frame.size;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:self.scrollView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 80;
    [self.scrollView setContentOffset:pt animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
}
@end
