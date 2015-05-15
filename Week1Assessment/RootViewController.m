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

@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentedControl;

@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *webBarButton;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webBarButton.enabled = false; // initially, web button is disabled

    // set tint color of navigation bar to white (specifically needed this to get back button text to turn white)
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    // set up layer properties of objects on screen (border color, width, corner radius)
    [self setUpLayerProperties:self.calculateButton];
    [self setUpLayerProperties:self.valueOneTextField];
    [self setUpLayerProperties:self.valueTwoTextField];
}


-(void)setUpLayerProperties:(UIView *)object {
// set the layer properties of a UIView * object, including border width, border color, and corner radius (for rounded edges)

    object.layer.cornerRadius = 10;
    object.layer.borderWidth = 1.5f;
    object.layer.borderColor = [UIColor blackColor].CGColor;
}

-(int)calculateAnswer:(int)valueOne :(int)valueTwo {
    switch (self.operatorSegmentedControl.selectedSegmentIndex) {
        case 0:
            return valueOne + valueTwo;
            break;
        case 1:
            return valueOne - valueTwo;
            break;
        case 2:
            return valueOne * valueTwo;
            break;
        case 3:
            return valueOne / valueTwo;
            break;
        default:
            return 0;
            break;
 }
}


- (IBAction)onCalculatePressed:(UIButton *)sender {
// Calculate product of values entered in text fields and display as title of the navigation bar item

    // only calculate if value entered in both fields
    if (self.valueOneTextField.text.length > 0 &&
        self.valueTwoTextField.text.length > 0) {

        // grab int values from each text field
        int valueOne = [self.valueOneTextField.text intValue];
        int valueTwo = [self.valueTwoTextField.text intValue];

        // calculate answer based on operator
        int answer = [self calculateAnswer:valueOne :valueTwo];

        // set title of navbar to product of values
        self.title = [NSString stringWithFormat:@"%d", answer];

        // if product is multiple of 5, enable web bar button (else, disable it)
        self.webBarButton.enabled = (answer % 5 == 0);

        // force first responder (possibly one of the text fields) to resign, thereby closing any visible keyboards
        [self.view endEditing:true];
    }
}


- (IBAction)onOperatorChanged:(UISegmentedControl *)sender {
// change the operator displayed between text fields when operator selected in segmented control, preserving text attributes

    // get original attributes of text
    NSRange range = NSMakeRange(0, 1);
    NSDictionary *attributes = [self.operatorLabel.attributedText attributesAtIndex:0 effectiveRange: &range];
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.operatorLabel setAttributedText:[[NSAttributedString alloc] initWithString:@"+" attributes:attributes]];
            break;
        case 1:
            [self.operatorLabel setAttributedText:[[NSAttributedString alloc] initWithString:@"-" attributes:attributes]];
            break;
        case 2:
            [self.operatorLabel setAttributedText:[[NSAttributedString alloc] initWithString:@"X" attributes:attributes]];
            break;
        case 3:
            [self.operatorLabel setAttributedText:[[NSAttributedString alloc] initWithString:@"/" attributes:attributes]];
            break;
        default:
            break;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    WebViewController *webVC = segue.destinationViewController;

    webVC.url = @"http://www.mobilemakers.co"; // set url for web view to load
    webVC.title = self.title; // set web view controller's title to current title
}

@end
