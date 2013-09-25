//
//  STCreateGameViewController.m
//  Stats
//
//  Created by Clark Barry on 9/8/13.
//  Copyright (c) 2013 KCBarry. All rights reserved.
//

#import "STCreateGameViewController.h"
#import "STTeamTableViewController.h"

@interface STCreateGameViewController () {
    STTeamTableViewController *_homeTable;
    STTeamTableViewController *_awayTable;
}

- (void)_cancelButtonPressed;
- (void)_doneButtonPressed;
@end

@implementation STCreateGameViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setTitle:@"Create Game"];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self.view setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self
                                                                                  action:@selector(_cancelButtonPressed)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(_doneButtonPressed)];
    [self.navigationItem setRightBarButtonItem:doneButton];
    
    _homeTable = [[STTeamTableViewController alloc] init];
    [_homeTable.view setFrame:CGRectMake(CGRectGetMinX(self.view.frame), CGRectGetMinY(self.view.frame),
                                         CGRectGetWidth(self.view.frame)/3.0, CGRectGetHeight(self.view.frame))];
    [_homeTable setTitle:@"Home"];

    [self.view addSubview:_homeTable.view];
    
    _awayTable = [[STTeamTableViewController alloc] init];
    [_awayTable.view setFrame:CGRectMake(CGRectGetMaxX(self.view.frame)-(CGRectGetWidth(self.view.frame)/3.0), 0,
                                         CGRectGetWidth(self.view.frame)/3.0, CGRectGetHeight(self.view.frame))];
    [_awayTable setTitle:@"Away"];
    
    [self.view addSubview:_awayTable.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_homeTable.view setFrame:CGRectMake(CGRectGetMinX(self.view.frame), CGRectGetMinY(self.view.frame),
                                         CGRectGetWidth(self.view.frame)/3.0, CGRectGetHeight(self.view.frame))];
    [_awayTable.view setFrame:CGRectMake(CGRectGetMaxX(self.view.frame)-(CGRectGetWidth(self.view.frame)/3.0), CGRectGetMinY(self.view.frame),
                                         CGRectGetWidth(self.view.frame)/3.0, CGRectGetHeight(self.view.frame))];
}

- (void)_cancelButtonPressed {
    UINavigationController *presentingViewController = (UINavigationController *)self.presentingViewController;
    [presentingViewController popViewControllerAnimated:NO];
    [presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

- (void)_doneButtonPressed {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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
