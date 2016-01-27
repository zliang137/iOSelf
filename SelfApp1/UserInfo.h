//
//  UserInfo.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/18/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic)NSUserDefaults *loginInfo;

+(id)initialize;

@end
