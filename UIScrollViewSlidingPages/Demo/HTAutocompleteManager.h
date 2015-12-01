//
//  HTAutocompleteManager.h
//  UIScrollSlidingPages
//
//  Created by Ramasamy Dayanand on 12/1/15.
//  Copyright © 2015 Thomas Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTAutocompleteTextField.h"

@interface HTAutocompleteManager : NSObject <HTAutocompleteDataSource>
+ (HTAutocompleteManager *)sharedManager;

@end
