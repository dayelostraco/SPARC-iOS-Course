//
//  DetailViewController.h
//  QUAKE
//
//  Created by Jonathan Spohn on 12/13/12.
//  Copyright (c) 2012 SPARC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Event.h"

@interface DetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *detailLabel;


@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSManagedObject *object;
@property (strong, nonatomic) Event *event;

@end
