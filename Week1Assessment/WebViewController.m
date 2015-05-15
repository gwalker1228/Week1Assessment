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

    // set self as delegate for web view
    self.webView.delegate = self;

    // load web view with text from url property
    [self loadRequestWithText:self.url];
}


-(void)loadRequestWithText:(NSString *)text {
// load request with url from NSString *text

    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


#pragma mark - WebViewDelegate methods


-(void)webViewDidStartLoad:(UIWebView *)webView {

    // start animating activity indicator
    [self.loadingIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {

    // stop animating, hide activity indicator (hides when stopped)
    [self.loadingIndicator stopAnimating];
}

@end
