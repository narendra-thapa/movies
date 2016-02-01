//
//  ReviewManager.h
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReviewManager : NSObject

@property (nonatomic, strong) NSMutableArray *reviewList;
@property (nonatomic, strong) NSDictionary *reviewDictionary;

- (void)loadReviewsToArray;

@end
