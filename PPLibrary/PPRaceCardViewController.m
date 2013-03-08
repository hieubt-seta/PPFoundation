//
//  PPRaceCardViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPRaceCardViewController.h"
#import "PPVideoViewController.h"
#import "PPHorseDetailsViewController.h"
#import "PPJockeyDetailsViewController.h"
#import "PPTrainerDetailsViewController.h"

@interface PPRaceCardViewController ()
- (void)setupBarButtonItems;
@end

@implementation PPRaceCardViewController

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
    self.title = LSSTRING(@"Race Card");
    [self setupBarButtonItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupBarButtonItems
{
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:LSSTRING(@"Video") style:UIBarButtonItemStyleBordered target:self action:@selector(menuItemVideoClicked:)] autorelease];
}

- (void)menuItemVideoClicked:(id)sender
{
    PPVideoViewController *vc = [[[PPVideoViewController alloc] initWithNibName:@"PPVideoViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnHorseDetailsClicked:(id)sender {
    PPHorseDetailsViewController *vc = [[[PPHorseDetailsViewController alloc] initWithNibName:@"PPHorseDetailsViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnJockeyDetailsClicked:(id)sender {
    PPJockeyDetailsViewController *vc = [[[PPJockeyDetailsViewController alloc] initWithNibName:@"PPJockeyDetailsViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)btnTrainerDetailsClicked:(id)sender {
    PPTrainerDetailsViewController *vc = [[[PPTrainerDetailsViewController alloc] initWithNibName:@"PPTrainerDetailsViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
