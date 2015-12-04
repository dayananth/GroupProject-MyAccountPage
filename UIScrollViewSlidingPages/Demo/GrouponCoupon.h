//
//  GrouponCoupon.h
//  Kopan
//
//  Created by Nizha Shree Seenivasan on 11/28/15.
//  Copyright © 2015 Nizha Shree Seenivasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GrouponDeal.h"

@interface GrouponCoupon : NSObject

@property (strong, nonatomic) NSDictionary* coupon;
@property (strong, nonatomic) GrouponDeal* deal;
@property (strong, nonatomic) NSString* couponCode;
@property (strong, nonatomic) NSString* source;
@property (strong, nonatomic) NSString* request_to_sell;
@property (nonatomic) int user_id;
@property (strong, nonatomic) NSDate* expiresAt;

- (id) initWithDictionary:(NSDictionary*) dictionary;
@end