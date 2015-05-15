//
//  ViewController.m
//  Week1Assessment
//
//  Created by Gretchen Walker on 5/15/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *webBarButton;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webBarButton.enabled = false; // initially, web button is disabled


}

- (IBAction)onCalculatePressed:(UIButton *)sender {
// Calculate product of values entered in text fields and display as title of the navigation bar item

    // only calculate if value entered in both fields
    if (self.valueOneTextField.text.length > 0 &&
        self.valueTwoTextField.text.length > 0) {

        // grab int values from each text field
        int valueOne = [self.valueOneTextField.text intValue];
        int valueTwo = [self.valueTwoTextField.text intValue];

        int product = valueOne * valueTwo;

        // set title of navbar to product of values
        self.title = [NSString stringWithFormat:@"%d", product];


        // if product is multiple of 5, enable web bar button (else, disable it)
        self.webBarButton.enabled = (product % 5 == 0);

        // force first responder (possibly one of the text fields) to resign, thereby closing any visible keyboards
        [self.view endEditing:true];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    WebViewController *webVC = segue.destinationViewController;

    webVC.url = @"http://www.mobilemakers.co"; // set url for web view to load
    webVC.title = self.title; // set web view controller's title to current title

}

@end
