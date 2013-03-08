//
//  PPSideMenuViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/7/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPSideMenuViewController.h"

@interface PPSideMenuViewController ()

@property (strong, nonatomic) NSArray *menuItems;

@end

@implementation PPSideMenuViewController

- (void)dealloc
{
    [self unregisterNotifications];
    [_tableView release];
    [_menuItems release];
    [super dealloc];
}

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
    [self registerNotifications];
    [self setupMenuItems];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setMenuItems:nil];
    [self unregisterNotifications];    
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authenticationStatusDidChangeNotification:) name:kAuthenticationStatusDidChangeNotification object:nil];
}

- (void)authenticationStatusDidChangeNotification:(NSNotification *)notification
{
    [self setupMenuItems];
}

- (void)setupMenuItems
{
    if (self.PP_SESSION.isAuthenticated) {
        self.menuItems = @[@"Race Mettings", @"Purchased Items", @"Settings", @"Language"];
    } else {
        self.menuItems = @[@"Race Mettings", @"Settings", @"Language"];
    }
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate/Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = switchview;
        [switchview release];
    }
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.accessoryView.hidden = YES;
    int lastRow = [self.menuItems count] - 1;
    if (indexPath.row == lastRow) {
        cell.accessoryView.hidden = NO;
    }
    return cell;
}

@end
