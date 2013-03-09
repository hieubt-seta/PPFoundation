//
//  PPRaceMeetingsController.m
//  winner21
//
//  Created by Hieu Bui on 3/7/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPRaceMeetingsController.h"
#import "PPRaceCardViewController.h"

@interface PPRaceMeetingsController ()

- (void)setupBarButtonItems;

@end

@implementation PPRaceMeetingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self registerNotifications];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = LSSTRING(@"Race Meetings");
    [self setupBarButtonItems];
}

- (void)registerNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authenticationStatusDidChangeNotification:) name:kAuthenticationStatusDidChangeNotification object:nil];
}

- (void)authenticationStatusDidChangeNotification:(NSNotification *)notification
{
    [self setupBarButtonItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupBarButtonItems
{
    if (self.PPSESSION.isAuthenticated) {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:LSSTRING(@"User Logged In") style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
        self.navigationItem.rightBarButtonItem.enabled = NO;
    } else {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:LSSTRING(@"Login") style:UIBarButtonItemStyleBordered target:self action:@selector(menuItemLoginClicked:)] autorelease];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}

#pragma mark UITableViewDelegate/Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PPRaceCardViewController *vc = [[[PPRaceCardViewController alloc] initWithNibName:@"PPRaceCardViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (void)menuItemLoginClicked:(id)sender
{
    [self.appDelegate showSplashView];
}

@end
