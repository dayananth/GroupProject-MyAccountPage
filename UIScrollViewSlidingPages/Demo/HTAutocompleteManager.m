//
//  HTAutocompleteManager.h
//  UIScrollSlidingPages
//
//  Created by Ramasamy Dayanand on 12/1/15.
//  Copyright © 2015 Thomas Thorpe. All rights reserved.
//

#import "HTAutocompleteManager.h"
#import "HTAutocompleteTextField.h"

static HTAutocompleteManager *sharedManager;

@implementation HTAutocompleteManager

+ (HTAutocompleteManager *)sharedManager
{
    static dispatch_once_t done;
    dispatch_once(&done, ^{ sharedManager = [[HTAutocompleteManager alloc] init]; });
    return sharedManager;
}

#pragma mark - HTAutocompleteTextFieldDelegate
- (NSString *)textField:(HTAutocompleteTextField *)textField completionForPrefix:(NSString *)prefix ignoreCase:(BOOL)ignoreCase{
    static dispatch_once_t onceToken;
    static NSArray *autocompleteArray;
    dispatch_once(&onceToken, ^
                  {
                      autocompleteArray = @[ @"Restaurants",
                                             @"Spa",
                                             @"Hotels",
                                             @"Electronics",
                                             @"Books",
                                             @"Apparels"
                                             ];
                  });
    
    NSString *stringToLookFor;
    NSArray *componentsString = [prefix componentsSeparatedByString:@","];
    NSString *prefixLastComponent = [componentsString.lastObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (ignoreCase)
    {
        stringToLookFor = [prefixLastComponent lowercaseString];
    }
    else
    {
        stringToLookFor = prefixLastComponent;
    }
    
    for (NSString *stringFromReference in autocompleteArray)
    {
        NSString *stringToCompare;
        if (ignoreCase)
        {
            stringToCompare = [stringFromReference lowercaseString];
        }
        else
        {
            stringToCompare = stringFromReference;
        }
        
        if ([stringToCompare hasPrefix:stringToLookFor])
        {
            return [stringFromReference stringByReplacingCharactersInRange:[stringToCompare rangeOfString:stringToLookFor] withString:@""];
        }
        
    }
    return @"";
}

- (void)autoCompleteTextFieldDidAutoComplete:(HTAutocompleteTextField *)autoCompleteField{
    NSLog(autoCompleteField.text);
}

@end
