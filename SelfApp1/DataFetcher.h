//
//  DataFetcher.h
//  SelfApp1
//
//  Created by Zhao Liang on 1/19/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TRVSURLSessionOperation/TRVSURLSessionOperation.h>

@interface DataFetcher : NSObject

@property (nonatomic)NSDictionary *dataDic;
@property (nonatomic)NSArray *dataSeriesArray;
//@property (nonatomic)NSURL *dataURL;
//@property (nonatomic)NSURL *imageURL;

-(void)fetchData:(NSURL *)url dataName:(NSString *)noticeName;
-(void)fetchSeriesOfDatas:(NSArray *)urlArray dataName:(NSString *)noticeName;
@end
