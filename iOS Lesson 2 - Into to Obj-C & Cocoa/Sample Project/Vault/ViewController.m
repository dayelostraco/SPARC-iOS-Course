//
//  ViewController.m
//  Vault
//
//  Created by Bobby Schuchert on 11/15/12.
//  Copyright (c) 2012 SPARC. All rights reserved.
//

#import "ViewController.h"
#import "Authenticator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//TODO: Add stuff

-(IBAction)vaultButtonPressed {
    
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    
    Authenticator *auth = [[Authenticator alloc] init];
    
    
    if ( [auth verifyUsername:username andPassword:password] ) {
        
        self.view.backgroundColor = [UIColor greenColor];
        
        [self performSegueWithIdentifier:@"showVault" sender:nil];
        
        
    } else {
        
        self.view.backgroundColor = [UIColor redColor];
    }

}


@end
