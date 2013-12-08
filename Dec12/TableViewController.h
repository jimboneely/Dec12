//
//  TableViewController.h
//  Dec12
//
//  Created by James Neely on 12/7/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController {
    NSString *cellReuseIdentifier;
    
	/*
     These instance variables are here because the table view controller
     is also active as the table view data source.
     */
	NSArray *headers;
	NSArray *categories;

}

@end
