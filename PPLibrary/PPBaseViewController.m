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

- (void)dealloc
{
    [self unregisterNotifications];
    [_progressHUD release];
    [super dealloc];
}

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
    self.PPSESSION = [PPSession sharedPPSession];
    self.PPSETTINGS = [PPSettingsManager sharedPPSettingsManager];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self localizeStrings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    DLog(@"Received Memory Warning - %@", [self class]);
    
    // Dispose of any resources that can be recreated.
    // only want to do this on iOS 6
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
        //  Don't want to rehydrate the view if it's already unloaded
        BOOL isLoaded = [self isViewLoaded];
        
        //  We check the window property to make sure that the view is not visible
        if (isLoaded && self.view.window == nil) {
            
            //  Give a chance to implementors to get model data from their views
            [self performSelectorOnMainThread:@selector(viewWillUnload)
                                   withObject:nil
                                waitUntilDone:YES];
            
            //  Detach it from its parent (in cases of view controller containment)
            [self.view removeFromSuperview];
            self.view = nil;    //  Clear out the view.  Goodbye!
            
            //  The view is now unloaded...now call viewDidUnload
            [self performSelectorOnMainThread:@selector(viewDidUnload)
                                   withObject:nil
                                waitUntilDone:YES];
        }
    }
}

- (PPAppDelegate *)appDelegate
{
    return (PPAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)registerNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageSettingDidChange:) name:kLanguageSettingDidChangeNotification object:nil];
}

- (void)unregisterNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (MBProgressHUD *)progressHUD
{
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc] initWithWindow:self.appDelegate.window];
        _progressHUD.animationType = MBProgressHUDAnimationFade;
        _progressHUD.dimBackground = YES;
		[self.appDelegate.window addSubview:_progressHUD];
    }
    return _progressHUD;
}

- (void)showLoadingView
{
    [self showLoadingViewWithTitle:@""];
}

- (void)showLoadingViewWithTitle:(NSString *)title
{
    _progressHUD.labelText = title;
    [_progressHUD show:YES];
}

- (void)hideLoadingView
{
    _progressHUD.labelText = @"";
    [_progressHUD hide:YES];
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title andDelegate:(id)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert show];
    [alert release];
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title delegate:(id)delegate andTag:(NSInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    alert.tag = tag;
    [alert show];
    [alert release];
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle delegate:(id)delegate andTag:(NSInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    alert.tag = tag;
    alert.delegate = delegate;
    [alert show];
    [alert release];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification object:nil];
}

- (void)unregisterForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    //Optional
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    //Optional
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    //Optional
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    //Optional    
}

- (void)languageSettingDidChange:(NSNotification *)notification
{
    [self localizeStrings];
}

- (void)localizeStrings
{
    // Optional
}

@end
