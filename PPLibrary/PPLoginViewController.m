//
//  PPLoginViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPLoginViewController.h"

@interface PPLoginViewController ()
{
    CGPoint _svos;
    BOOL _isShowingKeyboard;
}

@property (strong, nonatomic) UITextField *activeTextField;

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
    self.scrollView.contentSize = self.scrollView.frame.size;
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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    [_scrollView release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self unregisterForKeyboardNotifications];
    [self setTxtEmail:nil];
    [self setTxtPassword:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
    _svos = self.scrollView.contentOffset;
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
    self.activeTextField = nil;
}

@end
