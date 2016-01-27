//
//  uploadTest.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/18/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "uploadTest.h"

@implementation uploadTest

-(void)upLoad{
    
    NSURL * url = [NSURL URLWithString:@"https://api.instagram.com/oauth/authorize/?client_id=a2313528c7f140e7b05b61f0d10b8f82&redirect_uri=instagramsample://auth/instagram&response_type=token"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"data: %@,/n response: %@/n, error:%@", data, response, error.localizedDescription);
//    }];
//
//    [task resume];
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:frame];
    
    [webView loadRequest:request];
}

@end
