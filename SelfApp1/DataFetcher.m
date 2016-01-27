//
//  DataFetcher.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/19/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "DataFetcher.h"

@implementation DataFetcher

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataDic = [NSDictionary new];
        self.dataSeriesArray = [NSArray new];
    }
    return self;
}

-(void)fetchData:(NSURL *)url dataName:(NSString *)noticeName{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc]initWithContentsOfURL:location];
        self.dataDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:noticeName object:nil];
    }];
    
    [task resume];
}

-(void)fetchSeriesOfDatas:(NSArray *)urlArray dataName:(NSString *)noticeName{
    
//    NSLog(@"%@", urlArray);
    NSMutableArray *tempArray = [NSMutableArray new];
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount = 3;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    for (NSURL *url in urlArray){
        [queue addOperation:[[TRVSURLSessionOperation alloc]initWithSession:session request:[NSURLRequest requestWithURL:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            NSLog(@"%@", dataDic);
            [tempArray addObject:dataDic];
        }]];
    }
    
    [queue waitUntilAllOperationsAreFinished];
    
//    NSLog(@"%@", tempArray);
    
    self.dataSeriesArray = tempArray;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:noticeName object:nil];
}
@end
