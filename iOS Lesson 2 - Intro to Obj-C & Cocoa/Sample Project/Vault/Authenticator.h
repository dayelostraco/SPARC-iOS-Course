//
//  Authenticator.h
//  Vault
//
//  Created by Bobby Schuchert on 11/14/12.
//  Copyright (c) 2012 SPARC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authenticator : NSObject

-(BOOL)verifyUsername:(NSString *)username andPassword:(NSString *)password;

@end
