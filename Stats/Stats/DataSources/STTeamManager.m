//
//  STTeamManager.m
//  Stats
//
//  Created by Clark Barry on 9/9/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import "STTeamManager.h"

@implementation STTeamManager

static STTeamManager *__instance = nil;
+ (STTeamManager *)sharedManager {
    if (!__instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            __instance = [[STTeamManager alloc] init];
        });
    }
    return __instance;
}

@end
