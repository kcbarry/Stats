//
//  STGameViewController.m
//  Stats
//
//  Created by Clark Barry on 9/8/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import "STGameTableViewController.h"
#import "STCreateGameViewController.h"
#import "STStatViewController.h"

@interface STGameTableViewController ()

- (void)_addButtonPressed;
@end

@implementation STGameTableViewController

#pragma mark - Overrides

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self setTitle:@"Games"];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(_addButtonPressed)];
    [self.navigationItem setRightBarButtonItem:addButton];
}

#pragma mark - Internal

- (void)_addButtonPressed {
    STCreateGameViewController *createViewController = [[STCreateGameViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:createViewController];
    [self.navigationController presentViewController:navigationController
                                            animated:YES
                                          completion:^{
                                              STStatViewController *statViewController = [[STStatViewController alloc] init];
                                              [self.navigationController pushViewController:statViewController animated:NO];
                                          }];
}

@end
