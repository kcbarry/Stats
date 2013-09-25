//
//  STTeamTableViewController.m
//  Stats
//
//  Created by Clark Barry on 9/8/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import "STTeamTableViewController.h"
#import "STTeamManager.h"
#import "STTeamTableViewCell.h"
#import "STTeam.h"
#import "STCreateTeamViewController.h"

@interface STTeamTableViewController  ()

@property UITableViewController *tableViewController;

@end

@implementation STTeamTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    [_tableViewController setTitle:title];
}

- (void)loadView {
    [super loadView];
    [self.view setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    
    [_tableViewController.tableView setDelegate:self];
    [_tableViewController.tableView setDataSource:self];
    
    [self pushViewController:_tableViewController animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 1;
    if (section == 0) {
        count = ([[STTeamManager sharedManager].teams count]);
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        static NSString *kTeamCellID = @"team cell id";
        STTeamTableViewCell *teamCell = [tableView dequeueReusableCellWithIdentifier:kTeamCellID];
        if (!teamCell) {
            teamCell = [[STTeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTeamCellID];
        }
        STTeam *team = [[STTeamManager sharedManager].teams objectAtIndex:indexPath.row];
        [teamCell configureForTeam:team];
        cell = teamCell;
    } else if (indexPath.section == 1) {
        static NSString *kAddTeamCellID = @"add team cell id";
        UITableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:kAddTeamCellID];
        if (!addCell) {
            addCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kAddTeamCellID];
        }
        [addCell.textLabel setText:@"Add team"];
        [addCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell = addCell;
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        STCreateTeamViewController *createTeamViewController = [[STCreateTeamViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:createTeamViewController];
        [self presentViewController:navigationController
                           animated:YES
                         completion:nil];
        
    } 
}

@end
