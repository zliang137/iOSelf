//
//  LoginViewController.m
//  SelfApp1
//
//  Created by Zhao Liang on 1/18/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

#import "LoginViewController.h"

#define Token_Request @"token"
#define Wait_For_Token @"/oauth/authorize/%3Fclient_id%3Da2313528c7f140e7b05b61f0d10b8f82%26redirect_uri%3Dinstagramsample%3A//auth/instagram%26response_type%3Dtoken"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AccessAuthorizer *authorizer = [[AccessAuthorizer alloc]initWithClientID:@"a2313528c7f140e7b05b61f0d10b8f82" redirectURLStr:@"instagramsample://auth/instagram"];
    
    CGRect frame = self.view.bounds;
    UIWebView *webView = [[UIWebView alloc]initWithFrame:frame];
    
    [webView loadRequest:[authorizer authorizeRequest]];
    
    [self.view addSubview:webView];
    
    webView.delegate = self;
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *returnURLStr = request.URL.absoluteString;
    
    //NSLog(@"#######%@ \n", returnURLStr);
    
    NSArray *strArray = [returnURLStr componentsSeparatedByString:@"="];

    NSString *token = [strArray lastObject];
    
    //NSLog(@"!!!!!!!!%@ \n", token);
    
    UserInfo *userInfo = [[UserInfo alloc]init];
    
    [userInfo.loginInfo setValue:token forKey:@"token"];
    
    if( [token isEqualToString: Token_Request] == false && [token isEqualToString: Wait_For_Token] == false && token != nil){
        dispatch_async(dispatch_get_main_queue(), ^{
        
            InstagramHomeViewController *instagramHomeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"instagramHomeVC"];
            
            UINavigationController *instagramNavi = [[UINavigationController alloc]initWithRootViewController:instagramHomeVC];
            
            instagramNavi =[self.storyboard instantiateViewControllerWithIdentifier:@"instagramNavi"];
        
            [self presentViewController:instagramNavi animated:NO completion:nil];
        });
    }

    return true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
