//
//  PPVideoViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPVideoViewController.h"

@interface PPVideoViewController ()

@end

@implementation PPVideoViewController

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
}

- (void)localizeStrings
{
    [super localizeStrings];
    self.title = LSSTRING(@"Video");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
