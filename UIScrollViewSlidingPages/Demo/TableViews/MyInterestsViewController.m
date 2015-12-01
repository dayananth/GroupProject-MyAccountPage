//
//  MyInterestsViewController.m
//  UIScrollSlidingPages
//
//  Created by Ramasamy Dayanand on 11/30/15.
//  Copyright © 2015 Thomas Thorpe. All rights reserved.
//

#import "MyInterestsViewController.h"
#import "HTAutocompleteManager.h"

@interface MyInterestsViewController ()

@property (weak, nonatomic) IBOutlet HTAutocompleteTextField *interestsAutocompleteTextField;
@property (strong, nonatomic) HTAutocompleteTextField *currentTextField;
- (IBAction)onAddInterest:(UITapGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *interestsAddVIew;
@end

@implementation MyInterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.currentTextField = self.interestsAutocompleteTextField;
    [HTAutocompleteTextField setDefaultAutocompleteDataSource:[HTAutocompleteManager sharedManager]];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
//    UITextView *view = (UITextView *) sender.view;
//    NSLog(view.text);
    
    [self.interestsAutocompleteTextField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onAddInterest:(UITapGestureRecognizer *)sender {
    
    HTAutocompleteTextField *autoCompleteText = [[HTAutocompleteTextField alloc] init];
    autoCompleteText.backgroundColor = [UIColor redColor];
    autoCompleteText.borderStyle = UITextBorderStyleRoundedRect;
    autoCompleteText.font = [UIFont systemFontOfSize:15];
    autoCompleteText.placeholder = @"enter text";
    autoCompleteText.autocorrectionType = UITextAutocorrectionTypeNo;
    autoCompleteText.keyboardType = UIKeyboardTypeDefault;
    autoCompleteText.returnKeyType = UIReturnKeyDone;
    autoCompleteText.clearButtonMode = UITextFieldViewModeWhileEditing;
    autoCompleteText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    autoCompleteText.delegate = self;
    NSArray *subViews = [self.interestsAddVIew subviews];
    [self.view addSubview:autoCompleteText];
}
@end
