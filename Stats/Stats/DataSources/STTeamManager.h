//
//  STTeamManager.h
//  Stats
//
//  Created by Clark Barry on 9/9/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STTeamManager : NSObject

+ (STTeamManager *)sharedManager;

@property (readonly) NSArray *teams;

@end
