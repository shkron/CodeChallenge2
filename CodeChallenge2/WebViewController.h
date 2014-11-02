//
//  WebViewController.h
//  CodeChallenge2
//
//  Created by Alex on 11/1/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSURLRequest *urlRequest;


@end
