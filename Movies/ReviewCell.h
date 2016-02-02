//
//  ReviewCell.h
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *reviewCritic;
@property (weak, nonatomic) IBOutlet UILabel *reviewDate;
@property (weak, nonatomic) IBOutlet UILabel *reviewScore;
@property (weak, nonatomic) IBOutlet UILabel *reviewFreshness;
@property (weak, nonatomic) IBOutlet UILabel *reviewPublication;
@property (weak, nonatomic) IBOutlet UILabel *reviewQuote;

@end
