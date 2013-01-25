//
//  ViewController.h
//  NSURLTestForClass
//
//  Created by Bobby Schuchert on 1/24/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableData *receivedData;

@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *earthQuakes;

@end
