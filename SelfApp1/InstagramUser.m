//
//  InstagramUser.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/20/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "InstagramUser.h"

@implementation InstagramUser

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userName = [NSString new];
        self.userID = [NSString new];
        self.fullName = [NSString new];
        self.icon = [UIImage new];
        self.recentPosts = [NSArray new];
    }
    return self;
}

@end
