//
//  UserInfo.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/18/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+(id)initialize{
    static UserInfo *userInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[self alloc]init];
    });
    return userInfo;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.loginInfo = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
    
}

@end
