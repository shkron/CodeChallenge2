//
//  CityDetailViewController.m
//  CodeChallenge2
//
//  Created by Alex on 10/30/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WebViewController.h"

@interface CityDetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;


@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stateLabel.text = self.theCity.cityState;
    self.urlLabel.text = self.theCity.cityURL;
    self.cityImageView.image = (UIImage *)self.theCity.cityImage;
    self.cityNameTextField.delegate = self;
    self.stateNameTextField.delegate = self;




}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    if (![self.cityNameTextField.text  isEqual: @""])
    {
        [self changeCityName:nil];
    }
    if (![self.stateNameTextField.text  isEqual: @""])
    {
        [self changeStateName:nil];

    }

    return YES;
}

- (IBAction)changeCityName:(UITextField *)sender
{
    self.theCity.cityName = self.cityNameTextField.text;
    self.navigationItem.title = self.cityNameTextField.text;
    [self.cityNameTextField resignFirstResponder];
}

- (IBAction)changeStateName:(UITextField *)sender
{
    self.theCity.cityState = self.stateNameTextField.text;
    [self.stateNameTextField resignFirstResponder];
    self.stateLabel.text = self.stateNameTextField.text;

}
- (IBAction)tapHandler:(UITapGestureRecognizer *)tap
{
    [self performSegueWithIdentifier:@"webSegue" sender:self];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITapGestureRecognizer *)tap
{
    WebViewController *webVC = segue.destinationViewController;

    NSURL *url = [NSURL URLWithString:self.theCity.cityURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webVC.urlRequest = request;
//    [webVC.webView loadRequest:request];



}

@end
