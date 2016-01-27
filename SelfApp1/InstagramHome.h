//
//  InstagramHome.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/20/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataHandler.h"
#import "InstagramUser.h"
#import "URLConstructor.h"
#import "DataFetcher.h"


@interface InstagramHome : NSObject<DataHandler, URLConstructor>

@property (nonatomic) NSDictionary *followsDic;

-(void)setupFollowsArrayWithData:(NSDictionary *)dataDic;
-(void)passRecentPostToEachFollow:(NSArray *)dataSeriesArray;

@end
