//
//  AccessAuthorizer.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/18/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessAuthorizer : NSObject

@property (nonatomic) NSString* clientID;
@property (nonatomic) NSURL* redirectURL;

-(instancetype)initWithClientID:(NSString *)clientID redirectURLStr:(NSString *)urlStr;
-(NSURLRequest *)authorizeRequest;


@end
