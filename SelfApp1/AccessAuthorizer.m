//
//  AccessAuthorizer.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/18/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "AccessAuthorizer.h"
#define OAuth_Instagram_URL_Prefix @"https://api.instagram.com/oauth/authorize/?client_id="
#define OAuth_Instagram_URL_Infix @"&redirect_uri="
#define OAuth_Instagram_URL_Suffix @"&response_type=token"

@implementation AccessAuthorizer

-(instancetype)initWithClientID:(NSString *)clientID redirectURLStr:(NSString *)urlStr{
    self = [super init];
    
    if(self){
        self.clientID = clientID;
        self.redirectURL = [NSURL URLWithString:urlStr];
    }
    
    return self;
    
}

-(NSURLRequest *)authorizeRequest{
    
    NSURL *url = [NSURL URLWithString:[[[[OAuth_Instagram_URL_Prefix stringByAppendingString:self.clientID]stringByAppendingString:OAuth_Instagram_URL_Infix] stringByAppendingString: self.redirectURL.absoluteString] stringByAppendingString:OAuth_Instagram_URL_Suffix]];
    
    return [NSURLRequest requestWithURL:url];
    
}


@end
