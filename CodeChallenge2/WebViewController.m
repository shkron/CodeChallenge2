//
//  WebViewController.m
//  CodeChallenge2
//
//  Created by Alex on 11/1/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.webView loadRequest:self.urlRequest];



}

- (IBAction)goBackInView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
