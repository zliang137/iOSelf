//
//  InstagramUser.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/20/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InstagramUser : NSObject

@property (nonatomic)NSString *userName;
@property (nonatomic)NSString *userID;
@property (nonatomic)NSString *fullName;
@property (nonatomic)UIImage *icon;
@property (nonatomic)NSArray *recentPosts;

@end
