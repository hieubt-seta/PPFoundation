//
//  PPSideMenuViewController.m
//  winner21
//
//  Created by Hieu Bui on 3/7/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPSideMenuViewController.h"
#import "PPSettingsViewController.h"
#import "PPPurchasedIssuesViewController.h"

@interface PPSideMenuViewController ()

@property (strong, nonatomic) NSArray *menuItems;

@end

@implementation PPSideMenuViewController

- (void)dealloc
{
    [_tableView release];
    [_menuItems release];
    [super dealloc];
}

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
    [self setupMenuItems];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setMenuItems:nil]; 
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
    if (self.PPSESSION.isAuthenticated) {
        self.menuItems = @[LSSTRING(@"Race Mettings"), LSSTRING(@"Purchased Items"), LSSTRING(@"Settings"), LSSTRING(@"Language")];
    } else {
        self.menuItems = @[LSSTRING(@"Race Mettings"), LSSTRING(@"Settings"), LSSTRING(@"Language")];
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
        UISwitch *switchview = [[[UISwitch alloc] initWithFrame:CGRectZero] autorelease];
        [switchview addTarget:self action:@selector(switchDidChangeState:) forControlEvents:UIControlEventTouchUpInside];
        if (self.PPSETTINGS.currentLanguage == PPAppLanguageEnglish) {
            [switchview setOn:YES];
        } else {
            [switchview setOn:NO];
        }
        cell.accessoryView = switchview;
    }
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.accessoryView.hidden = YES;
    int lastRow = [self.menuItems count] - 1;
    if (indexPath.row == lastRow) {
        cell.accessoryView.hidden = NO;
    }
    return cell;
}

- (void)switchDidChangeState:(id)sender
{
    UISwitch *switchView = (id)sender;
    if (switchView.isOn) {
        [self.PPSETTINGS setCurrentLanguage:PPAppLanguageEnglish];
    } else {
        [self.PPSETTINGS setCurrentLanguage:PPAppLanguageChinese];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.PPSESSION.isAuthenticated) {
        switch (indexPath.row) {
            case 0: // Race meetings
                [self gotoRaceMeetingsView];
                break;
            case 1: // Purchased issues
                [self gotoPurchasedIssuesView];
                break;
            case 2: // Settings
                [self gotoSettingsView];
                break;
            case 3: // Language
                break;
            default:
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0: // Race meetings
                [self gotoRaceMeetingsView];
                break;
            case 1: // Settings
                [self gotoSettingsView];
                break;
            case 2: // Language
                break;
            default:
                break;
        }
    }
}

- (void)gotoRaceMeetingsView
{
    self.appDelegate.sideMenu.navigationController.viewControllers = @[self.appDelegate.mainViewController];
    [self.appDelegate.sideMenu setMenuState:MFSideMenuStateClosed];
}

- (void)gotoPurchasedIssuesView
{
    PPPurchasedIssuesViewController *vc = [[[PPPurchasedIssuesViewController alloc] initWithNibName:@"PPPurchasedIssuesViewController" bundle:nil] autorelease];
    self.appDelegate.sideMenu.navigationController.viewControllers = @[vc];
    [self.appDelegate.sideMenu setMenuState:MFSideMenuStateClosed];    
}

- (void)gotoSettingsView
{
    PPSettingsViewController *vc = [[[PPSettingsViewController alloc] initWithNibName:@"PPSettingsViewController" bundle:nil] autorelease];
    self.appDelegate.sideMenu.navigationController.viewControllers = @[vc];
    [self.appDelegate.sideMenu setMenuState:MFSideMenuStateClosed];    
}

@end
