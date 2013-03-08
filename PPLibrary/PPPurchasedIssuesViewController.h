//
//  PPPurchasedIssuesViewController.h
//  winner21
//
//  Created by Hieu Bui on 3/7/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPBaseViewController.h"

@interface PPPurchasedIssuesViewController : PPBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
