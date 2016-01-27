//
//  URLConstructor.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/21/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLConstructor <NSObject>

@optional

-(NSURL *)urlConstructWithBase:(NSString *)baseURL andToken:(NSString *)token;
-(NSURL *)urlConstructWithBase:(NSArray *)baseURLSeries userID:(NSString *)userID andToken:(NSString *)token;

@end
