//
//  PPLoginViewController.h
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPBaseViewController.h"

@interface PPLoginViewController : PPBaseViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *txtEmail;
@property (retain, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLoginClicked:(id)sender;

@end
