//
//  STCreateTeamViewController.m
//  Stats
//
//  Created by Clark Barry on 9/24/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import "STCreateTeamViewController.h"

@interface STCreateTeamViewController ()

@end

@implementation STCreateTeamViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTitle:@"Create Team"];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor blueColor]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
