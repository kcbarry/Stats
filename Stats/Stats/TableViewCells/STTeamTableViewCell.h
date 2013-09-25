//
//  STTeamTableViewCell.h
//  Stats
//
//  Created by Clark Barry on 9/9/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import "STTableViewCell.h"
@class STTeam;

@interface STTeamTableViewCell : STTableViewCell
- (void)configureForTeam:(STTeam *)team;
@end
