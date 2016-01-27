//
//  InstagramHome.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/20/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "InstagramHome.h"


@implementation InstagramHome{
    id<DataHandler>dataHandler;
    id<URLConstructor>urlConstructor;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.followsDic = [NSDictionary new];
        dataHandler = self;
        urlConstructor = self;
    }
    return self;
}

-(void)setupFollowsArrayWithData:(NSDictionary *)dataDic{
    
    self.followsdic = [self createFollowsArrayWith:[self getDataArrayWithData:dataDic]];
    
    //need to be modified
    
}

-(void)passRecentPostToEachFollow:(NSArray *)dataSeriesArray{
    for(NSDictionary *dataDic in dataSeriesArray){
        
        //[[self.followsDic objectAtIndex:[dataSeriesArray indexOfObject:dataDic]] setRecentPosts:[self getDataArrayWithData:dataDic]];
        
    }
}


-(NSArray *)getDataArrayWithData:(NSDictionary *)dataDic{
    
    return dataDic[@"data"];
}

-(NSDictionary *)createFollowsArrayWith:(NSArray *)dataArray{

    NSDictionary *followsDic = [NSDictionary new];

    for(NSDictionary *userEntity in dataArray){
        
        InstagramUser *user = [InstagramUser new];
        
        user.userName = userEntity[@"username"];
        user.userID = userEntity[@"id"];
        user.icon = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userEntity[@"profile_picture"]]]];
        user.fullName = userEntity[@"full_name"];
        
        [followsDic setValue:user forKey:user.userID];
    }
    
    return followsDic;
}

-(NSURL *)urlConstructWithBase:(NSString *)baseURL andToken:(NSString *)token{
    return [NSURL URLWithString:[baseURL stringByAppendingString:token]];
}

-(NSURL *)urlConstructWithBase:(NSArray *)baseURLSeries userID:(NSString *)userID andToken:(NSString *)token{
    
    return [NSURL URLWithString:[[[(NSString *)baseURLSeries[0] stringByAppendingString:userID]stringByAppendingString:baseURLSeries[1]]stringByAppendingString:token]];
}
@end
