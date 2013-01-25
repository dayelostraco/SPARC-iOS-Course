//
//  ViewController.m
//  NSURLTestForClass
//
//  Created by Bobby Schuchert on 1/24/13.
//  Copyright (c) 2013 SPARC. All rights reserved.
//

#import "ViewController.h"

#define kURL @"http://earthquake.usgs.gov/earthquakes/feed/geojson/all/hour"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"EarthQuake Feed";
    
    [self getDataAsyncronouslyFromUrl:kURL];
    //[self getDataSynchronouslyFromUrl:kURL];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)handleData:(NSData *)data {
    
    
    NSError* error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    _earthQuakes = [json objectForKey:@"features"];
   
    
//    NSLog(@"Count: %d", [_earthQuakes count]);
    
    [self.tableView reloadData];
    
    //NSLog(@"Data: %@", _earthQuakes);
    
}


-(void)getDataAsyncronouslyFromUrl:(NSString *)url {
    
    // Create the request.
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        
        _receivedData = [NSMutableData data];
        
    } else {
        
        NSLog(@"Error");
    }

    
}


-(void)getDataSynchronouslyFromUrl:(NSString *)url {
    
    
    NSMutableData *syncData = [NSMutableData dataWithContentsOfURL:[NSURL URLWithString:url]];
    [self handleData:syncData];
    
}



#pragma mark - NSURLConnection Delegate Methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receivedData appendData:data];
    
    //NSLog(@"Data: %@", data);
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    [self handleData:_receivedData];
    
}




#pragma mark - UITableView Datasource Methods
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_earthQuakes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    NSDictionary *currentQuake = [_earthQuakes objectAtIndex:indexPath.row];

    NSDictionary *quakeProperties = [currentQuake objectForKey:@"properties"];
    
    // Configure the cell...
    cell.textLabel.text = [quakeProperties objectForKey:@"place"];
    cell.detailTextLabel.text = [self prettyStringForUnixTime:[quakeProperties objectForKey:@"time"]];
    
    return cell;
}




#pragma mark - Convenience Methods


-(NSString *)prettyStringForUnixTime:(NSString *)string {
    
//    NSLog(@"string: %@", string);
    
    double milliseconds = [string doubleValue];
    double seconds = milliseconds/1000;
//    
//    NSLog(@"milli: %f", milliseconds);
//    NSLog(@"secs: %f", seconds);
    
    
    NSDate *theDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    
    
    return [dateFormatter stringFromDate:theDate];

}







@end
