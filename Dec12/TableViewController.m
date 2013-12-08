//
//  TableViewController.m
//  Dec12
//
//  Created by James Neely on 12/7/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@end

@implementation TableViewController

- (void) setTitle {
	self.title = [NSString stringWithFormat:
                  @"Hardware Inventory",
                  nil
                  ];
}

- (id) initWithStyle: (UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) {
		// Custom initialization
		cellReuseIdentifier = @"zones";
        
        [self setTitle];
        
		//An array of five strings.
		headers = [NSArray arrayWithObjects:
                   @"Video",
                   @"Lenses",
                   @"Laptops",
                   @"Audio",
                   @"Miscellaneous",	//The \n (newline) skips an extra line.
                   nil		];
        
		//An array of five arrays (Miyamoto Musashi).
		categories = [NSArray arrayWithObjects:
                      
                      //video
                      [NSArray arrayWithObjects:
                       @"Canon EOS 5D Mark II Digital Camera",
                       @"Canon EOS 5D Mark III Digital Camera",
                       @"Canon EOS 7D SLR Digital Camera",
                       @"Canon LC-E6 Battery Charger",
                       @"GoPro HD HERO",
                       @"Sony NEX-FS700U",
                       @"Sony PMW-100 XDCAM",
                       nil
                       ],
                      
                      //lenses
                      [NSArray arrayWithObjects:
                       @"Canon EF 16-35mm f/2.8L II USM Autofocus Lens",
                       @"Canon EF 24-70mm f/2.8L II USM Zoom Lens",
                       @"Canon EF 35mm f/1.4L USM Wide-Angle Autofocus Lens",
                       @"Canon EF 70-200mm f/2.8L IS II USM Telephoto Zoom Lens",
                       @"Canon EF 85mm f/1.2L II USM Autofocus Lens",
                       @"Canon EF 100mm f/2.8L Macro IS USM Lens",
                       nil
                       ],
                      
                      //laptops
                      [NSArray arrayWithObjects:
                       @"MacBook Pro - Aardvark 8,2 (Intel Core i7) 2.3GHZ 8GB 10.6 CS5",
                       @"MacBook Pro - Dolphin 8,2 (Intel Core i7) 8GB RAM 1333 MHz 10.8.3 Hi Resb",
                       @"MacBook Air - Dragonfly 1,1 Intel Core 2 Duo 1.8GHZ 2GB",
                       @"MacBook - Eagle 2,1 (Intel Core 2 Duo) 2GHZ 2GB 10.6 CS5",
                       @"MacBook - Stallion 8,2 (Intel Core i7) 2.2GHZ 8GB 10.8 CS6",
                       nil
                       ],
                      
                      //audio
                      [NSArray arrayWithObjects:
                       @"Audio-Technica AT897",
                       @"Canon Stereo Microphone",
                       @"Sennheiser EK 100 G3 Wireless Bodypack Receiver",
                       @"Sennheiser MKE 400",
                       nil
                       ],
                      
                      //Miscellaneous
                      [NSArray arrayWithObjects:
                       @"Apple USB SuperDrive",
                       @"Steadicam Smoothee for iPhone 4 or 4S",
                       @"G-Technology 4TB G-RAID External Hard Drive Array",
                       nil
                       ],
                      
                      nil
                      ];
	}
	return self;
}

- (void) viewDidLoad
{
	[super viewDidLoad];
    
	[self.tableView registerClass: [UITableViewCell class]
           forCellReuseIdentifier: cellReuseIdentifier];
    
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
    
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
	// Return the number of sections.
	return categories.count;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
	// Return the number of rows in the section.
	NSArray *category = [categories objectAtIndex: section];
	return category.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellReuseIdentifier forIndexPath: indexPath];
    
	// Configure the cell...
	NSArray *category = [categories objectAtIndex: indexPath.section];
	cell.textLabel.text = [category objectAtIndex: indexPath.row];
	return cell;
}

- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section {
	return [headers objectAtIndex: section];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL) tableView: (UITableView *) tableView canEditRowAtIndexPath: (NSIndexPath *) indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void) tableView: (UITableView *) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath: (NSIndexPath *) indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void) tableView: (UITableView *) tableView moveRowAtIndexPath: (NSIndexPath *) fromIndexPath toIndexPath: (NSIndexPath *) toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL) tableView: (UITableView *) tableView canMoveRowAtIndexPath: (NSIndexPath *) indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
	UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
	
	//Toggle the cell's checkmark.
	if (cell.accessoryType == UITableViewCellAccessoryNone) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
}

@end
