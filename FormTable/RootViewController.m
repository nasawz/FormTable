//
//  RootViewController.m
//  FormTable
//
//  Created by zhe wang on 11-7-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#define TEXT_COLOR_NORMAL	 [UIColor colorWithRed:84.0/255.0 green:84.0/255.0 blue:84.0/255.0 alpha:1.0]
#define TEXT_COLOR_SELECT	 [UIColor colorWithRed:12.0/255.0 green:120.0/255.0 blue:167.0/255.0 alpha:1.0]

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    _formTableView = [[FormTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStyleGrouped];
    _formTableView.delegate = self;
    _formTableView.dataSource = self;
    [self.view addSubview:_formTableView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [NSString stringWithFormat: @"Cell%i", indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        
        if (indexPath.row == 0) {
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(10.0f, 1.0f, 100.0f, 43.0f);
            layer.contentsGravity = kCAGravityResizeAspect;
            layer.contents = (id)[UIImage imageNamed:@"formtitle-top.png"].CGImage;
            [cell.layer insertSublayer:layer atIndex:0];
            cell.textLabel.text = @"EMAIL";
            
//            emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 0, 190, 43)];
//            [emailTextField setBorderStyle:UITextBorderStyleNone];
//            [emailTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
//            [cell.contentView addSubview:emailTextField];
            
            
        } else if(indexPath.row > 0 && indexPath.row < ([tableView numberOfRowsInSection:0] - 1)){
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(10.0f, 0.0f, 100.0f, 43.0f);
            layer.contentsGravity = kCAGravityResizeAspect;
            layer.contents = (id)[UIImage imageNamed:@"formtitle-middle.png"].CGImage;
            [cell.layer insertSublayer:layer atIndex:0];
            
            if (indexPath.row == 1) {
                cell.textLabel.text = @"PASSWORD";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"BIRTHDAY";
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"GENDER";
            }            
        } else {
            CALayer *layer = [CALayer layer];
            layer.frame = CGRectMake(10.0f, 0.0f, 100.0f, 43.0f);
            layer.contentsGravity = kCAGravityResizeAspect;
            layer.contents = (id)[UIImage imageNamed:@"formtitle-bottom.png"].CGImage;
            [cell.layer insertSublayer:layer atIndex:0];
            
            if (indexPath.row == 4) {
                cell.textLabel.text = @"PHONE";
            }
        }
            
        
    }    
    
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [cell.textLabel setTextColor:TEXT_COLOR_NORMAL];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell; 
}
#pragma mark - UITableViewDelegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.textLabel setTextColor:TEXT_COLOR_SELECT];
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.textLabel setTextColor:TEXT_COLOR_NORMAL];    
}
@end
