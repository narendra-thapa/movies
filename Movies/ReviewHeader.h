//
//  ReviewHeader.h
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewHeader : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *reviewHeaderTitle;
@property (weak, nonatomic) IBOutlet UIImageView *reviewHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *reviewHeaderYear;
@property (weak, nonatomic) IBOutlet UILabel *reviewHeaderSynopsis;
@property (weak, nonatomic) IBOutlet UILabel *reviewHeaderRating;

@end
