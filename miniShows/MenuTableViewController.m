//
//  MenuTableViewController.m
//  miniShows
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import "MenuTableViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"

@interface MenuTableViewController ()

@property(nonatomic,strong)NSArray *data;
@end

@implementation MenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

- (NSArray *) data {
	if (!_data) {
		NSDictionary *series1 = @{@"image": [UIImage imageNamed:@"madmen"],
															@"name" : @"Mad Men",
															@"episode" : @"S06E03 The Collaborators",
															@"remaining" : @"1 behind"};
		NSDictionary *series2 = @{@"image": [UIImage imageNamed:@"gThrones"],
															@"name" : @"Game of Thrones",
															@"episode" : @"S04E10 The Children",
															@"remaining" : @"3 behind"};
		_data = @[series1,series2];
	}
	return _data;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
		
		CustomTableViewCell	*cell = [self.tableView dequeueReusableCellWithIdentifier:@"showCell" forIndexPath:indexPath];
		tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
		
	NSDictionary *serie=[[NSDictionary alloc]initWithDictionary:[self.data objectAtIndex:indexPath.row]];
		
		cell.Show.text=[serie objectForKey:@"name"];
	cell.chapter.text=[serie objectForKey:@"episode"];
		cell.behind.text=[serie objectForKey:@"remaining"];
		cell.imageCell.image=[serie objectForKey:@"image"];

	if ([[UIDevice currentDevice] orientation]==UIDeviceOrientationPortrait || ![[UIDevice currentDevice] orientation]) {
		cell.leftContraintBehind.constant=8;
		cell.topConstraintBehind.constant=61;
	}else{
		cell.leftContraintBehind.constant=300;
		cell.topConstraintBehind.constant=10;
	}
    return cell;
		
	}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation	{
	[self.tableView reloadData];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

	if([segue.identifier isEqualToString:@"detailSegue"]){
		DetailViewController *detail=[segue destinationViewController];
		NSIndexPath *index=[self.tableView indexPathForSelectedRow];
		
		NSDictionary *serie=[[NSDictionary alloc]initWithDictionary:[self.data objectAtIndex:index.row]];
		
		detail.title=[serie objectForKey:@"name"];
		detail.textPublic=[serie objectForKey:@"episode"];
		detail.imagePublic=[serie objectForKey:@"image"];
		
	}
}


@end
