//
//  InstagramHomeCell.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/20/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramUser.h"

@interface InstagramHomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *instagramIcon;

@property (weak, nonatomic) IBOutlet UIImageView *instagramHomeCellImage1;

@property (weak, nonatomic) IBOutlet UIImageView *instagramHomeCellImage2;

@property (weak, nonatomic) IBOutlet UIImageView *instagramHomeCellImage3;

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *fullName;

//@property (nonatomic) InstagramUser *user;

@end
