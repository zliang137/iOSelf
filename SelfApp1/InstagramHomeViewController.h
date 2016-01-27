//
//  ViewController.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/15/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramHomeCell.h"
#import "DataFetcher.h"
#import "InstagramHome.h"
#import "UserInfo.h"
#import "InstagramUser.h"

@interface InstagramHomeViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *instagramHomeTableView;

@property (nonatomic) InstagramHome *instagramHome;
@property (nonatomic) DataFetcher *dataFetcher;

@end

