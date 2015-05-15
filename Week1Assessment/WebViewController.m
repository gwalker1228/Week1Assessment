//
//  WebViewController.m
//  Week1Assessment
//
//  Created by Gretchen Walker on 5/15/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;

    [self loadRequestWithText:self.url];


    self.navigationItem.backBarButtonItem.title = @"Back";
}

-(void)loadRequestWithText:(NSString *)text {
// load request with url from NSString *text

    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - WebViewDelegate methods

-(void)webViewDidStartLoad:(UIWebView *)webView {

    [self.loadingIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {

    [self.loadingIndicator stopAnimating];
    self.loadingIndicator.hidden = true;
}

@end
