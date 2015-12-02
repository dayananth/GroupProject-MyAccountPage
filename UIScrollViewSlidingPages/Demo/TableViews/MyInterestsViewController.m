//
//  MyInterestsViewController.m
//  UIScrollSlidingPages
//
//  Created by Ramasamy Dayanand on 11/30/15.
//  Copyright © 2015 Thomas Thorpe. All rights reserved.
//

#import "MyInterestsViewController.h"
#import "HTAutocompleteManager.h"
#import "AddImageCell.h"
#import "AutocompleteTextFieldCell.h"
#import "InterestCell.h"

@interface MyInterestsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet HTAutocompleteTextField *interestsAutocompleteTextField;
@property (strong, nonatomic) HTAutocompleteTextField *currentTextField;
- (IBAction)onAddInterest:(UITapGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UIView *interestsAddVIew;
@property (weak, nonatomic) IBOutlet UITableView *interestsTableView;
@property (strong, nonatomic) NSMutableArray *interestsArray;
@property BOOL addInterest;
@end

@implementation MyInterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.currentTextField = self.interestsAutocompleteTextField;
    [HTAutocompleteTextField setDefaultAutocompleteDataSource:[HTAutocompleteManager sharedManager]];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    self.interestsTableView.delegate = self;
    self.interestsTableView.dataSource = self;
    [self.interestsTableView registerNib:[UINib nibWithNibName:@"InterestCell" bundle:nil] forCellReuseIdentifier:@"InterestCell"];
    [self.interestsTableView registerNib:[UINib nibWithNibName:@"AutocompleteTextFieldCell" bundle:nil] forCellReuseIdentifier:@"AutocompleteTextFieldCell"];
    [self.interestsTableView registerNib:[UINib nibWithNibName:@"AddImageCell" bundle:nil] forCellReuseIdentifier:@"AddImageCell"];
    [self initInterestsArray];
    self.addInterest = NO;
//    [self addAutocompleteSubView];
    
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
    NSLog(self.interestsAutocompleteTextField.text);
//    NSString *interestToBeSaved = [NSString stringWithFormat:@"%@%@", self.interestsAutocompleteTextField.text,[self.interestsAutocompleteTextField]]
    [self saveInterest:self.interestsAutocompleteTextField.text];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) addAutocompleteSubView{
    HTAutocompleteTextField *autoCompleteText = [[HTAutocompleteTextField alloc] init];
    autoCompleteText.text = @"test";
    autoCompleteText.textColor = [UIColor blackColor];
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
    //    NSArray *subViews = [self.interestsAddVIew subviews];
    [self.view addSubview:autoCompleteText];
}

- (IBAction)onAddInterest:(UITapGestureRecognizer *)sender {
    
//    HTAutocompleteTextField *autoCompleteText = [[HTAutocompleteTextField alloc] init];
//    autoCompleteText.textColor = [UIColor blackColor];
//    autoCompleteText.backgroundColor = [UIColor redColor];
//    autoCompleteText.borderStyle = UITextBorderStyleRoundedRect;
//    autoCompleteText.font = [UIFont systemFontOfSize:15];
//    autoCompleteText.placeholder = @"enter text";
//    autoCompleteText.autocorrectionType = UITextAutocorrectionTypeNo;
//    autoCompleteText.keyboardType = UIKeyboardTypeDefault;
//    autoCompleteText.returnKeyType = UIReturnKeyDone;
//    autoCompleteText.clearButtonMode = UITextFieldViewModeWhileEditing;
//    autoCompleteText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    autoCompleteText.delegate = self;
    NSArray *subViews = [self.view subviews];
//    [self.view addSubview:autoCompleteText];
    [self addAutocompleteSubView];
}

-(void)initInterestsArray{
    // Make call to get the interests
    _interestsArray  =  [NSMutableArray arrayWithObjects:@"Electronics", @"goods", @"hotels", nil]; // @[@"Electronics", @"goods", @"hotels"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.addInterest){
        return _interestsArray.count + 2;
    }
    return _interestsArray.count + 1;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int totalCount = _interestsArray.count + 1;
    NSLog([NSString stringWithFormat:@"%ld", indexPath.row]);
    if(self.addInterest){
        totalCount += 1;
    }
    
    if(indexPath.row == totalCount - 1){ //show Add interest option
        AddImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddImageCell"];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        self.addInterest = NO;
        [cell.addInterestImage addGestureRecognizer:tap];
        
        return cell;
    }else if (self.addInterest && indexPath.row == totalCount - 2){
            AutocompleteTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutocompleteTextFieldCell"];
            self.interestsAutocompleteTextField = cell.autoCompleteTextField;
            return cell;
    }else{
        InterestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InterestCell"];
        cell.interestLabel.text = self.interestsArray[indexPath.row];
        return cell;
    }
    
    return NULL;
}

-(void) handleTap:(UITapGestureRecognizer *)recognizer{
    self.addInterest = YES;
    [self.interestsTableView reloadData];
    NSLog(@"Tapped");
}

-(void) saveInterest:(NSString *) interest{
    [self.interestsArray addObject:interest];
    self.interestsAutocompleteTextField  = @"";
    [self.interestsTableView reloadData];
}


@end
