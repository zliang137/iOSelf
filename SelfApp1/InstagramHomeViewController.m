//
//  ViewController.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/15/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "InstagramHomeViewController.h"

#define Fetch_Follows_Data @"fetchFollows"
#define URL_Follows_Base @"https://api.instagram.com/v1/users/self/follows?access_token="

#define Fetch_Follow_Recent_Post_Data @"fetchFollowRecentPost"
#define URL_User_Recent_Post_Base @[@"https://api.instagram.com/v1/users/", @"/media/recent/?access_token="]

@interface InstagramHomeViewController ()

@end

@implementation InstagramHomeViewController{
    UserInfo *userInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.instagramHomeTableView.dataSource = self;
    
    self.instagramHomeTableView.estimatedRowHeight = 162;
    
    self.instagramHomeTableView.rowHeight = UITableViewAutomaticDimension;
    
    userInfo= [UserInfo new];
    self.instagramHome = [InstagramHome new];
    self.dataFetcher = [DataFetcher new];
    
    [self.dataFetcher fetchData:[self.instagramHome urlConstructWithBase: URL_Follows_Base andToken:[userInfo.loginInfo objectForKey:@"token"]] dataName:Fetch_Follows_Data];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(continueFetchFollowsCurrentPostData) name:Fetch_Follows_Data object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadData) name:Fetch_Follow_Recent_Post_Data object:nil];

}

-(void)continueFetchFollowsCurrentPostData{
    
    [self.instagramHome setupFollowsArrayWithData:self.dataFetcher.dataDic];
    
    NSMutableArray *urlArray = [NSMutableArray new];
    
    for (InstagramUser *user in self.instagramHome.followsArray){
        [urlArray addObject:[self.instagramHome urlConstructWithBase:URL_User_Recent_Post_Base userID:user.userID andToken:[userInfo.loginInfo objectForKey:@"token"]]];
    }
    
    [self.dataFetcher fetchSeriesOfDatas:urlArray dataName:Fetch_Follow_Recent_Post_Data];
}

-(void)reloadData{

    [self.instagramHome passRecentPostToEachFollow:self.dataFetcher.dataSeriesArray];
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.instagramHomeTableView reloadData];
    });
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InstagramHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"instagramHomeCell"];
    
    if(!cell){
        cell = [[InstagramHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"instagramHomeCell"];
    }
    
    InstagramUser *user = self.instagramHome.followsArray[indexPath.row];
    cell.userName.text = user.userName;
    cell.fullName.text = user.fullName;
    cell.instagramIcon.image = user.icon;
    cell.instagramIcon.layer.cornerRadius = 20;
    cell.instagramIcon.clipsToBounds = YES;
    cell.instagramHomeCellImage1.image = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[user.recentPosts objectAtIndex:0][@"images"][@"thumbnail"][@"url"]]]];
    cell.instagramHomeCellImage2.image = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[user.recentPosts objectAtIndex:1][@"images"][@"thumbnail"][@"url"]]]];
    cell.instagramHomeCellImage3.image = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[user.recentPosts objectAtIndex:2][@"images"][@"thumbnail"][@"url"]]]];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.instagramHome.followsArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
