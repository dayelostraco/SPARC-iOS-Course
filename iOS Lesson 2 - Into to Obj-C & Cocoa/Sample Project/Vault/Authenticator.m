//
//  Authenticator.m
//  Vault
//
//  Created by Bobby Schuchert on 11/14/12.
//  Copyright (c) 2012 SPARC. All rights reserved.
//

#import "Authenticator.h"

@implementation Authenticator

-(BOOL)verifyUsername:(NSString *)aUsername andPassword:(NSString *)aPassword {
    
    BOOL accessGranted = NO;
    
    if (([aUsername isEqualToString:@"admin"]) && ([aPassword isEqualToString:@"sparc"])) {
        
        accessGranted = YES;
        
    }
    
    return accessGranted;
}


@end
