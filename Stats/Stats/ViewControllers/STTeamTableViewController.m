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

@interface STTeamTableViewController  ()

@property (nonatomic) UITableView *tableView;

@end

@implementation STTeamTableViewController


- (void)loadView {
    [super loadView];
    [self.view setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
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

@end
