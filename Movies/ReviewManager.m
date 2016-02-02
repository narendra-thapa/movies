//
//  ReviewManager.m
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "ReviewManager.h"
#import "Review.h"


@implementation ReviewManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _reviewList = [[NSMutableArray alloc] init];
        _reviewDictionary = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)loadReviewsToArray {
    
    for (NSDictionary *reviews in self.reviewDictionary) {
        Review *review = [[Review alloc] init];
        
        review.critic = reviews[@"critic"];
        review.date = reviews[@"date"];
        review.score = reviews[@"original_score"];
        review.freshness = reviews[@"freshness"];
        review.publication = reviews[@"publication"];
        review.quote = reviews[@"quote"];
        
        [self.reviewList addObject:review];
        NSLog(@"%@", review.critic);
    }
}

//- (Review *)returnAReview:(NSIndexPath *)indexPath {
//    indexPath
//    //return [self.reviewList objectAtIndex:indexPath.r];
//}

- (Review *)returnAReview:(NSInteger)indexPath {
    return [self.reviewList objectAtIndex:indexPath];
}


- (NSUInteger)returnReviewCount {
    return self.reviewList.count;
}
@end
