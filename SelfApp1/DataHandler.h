//
//  DataHandler.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/20/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataHandler <NSObject>

@optional

-(NSArray *)getDataArrayWithData:(NSDictionary *)dataDic;

@end
