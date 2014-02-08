//
//  MainPageViewController.m
//  RedditBrowser
//
//  Created by Alex on 08/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "FrontPageTableViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

@synthesize theTableView, titleCollection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    titleCollection = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"/r/assettocorsa", @"/r/simracing", nil]];
    
    theTableView.delegate = self;
    theTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [titleCollection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mainPageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [titleCollection objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FrontPageTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"frontPageViewController"];
    
    controller.subredditName = [titleCollection objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
}





@end
