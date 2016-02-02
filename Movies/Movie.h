//
//  Movie.h
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Movie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *synopsis;
@property (nonatomic, copy) NSString *mpaRating;
@property (nonatomic, assign) NSUInteger year;
@property (nonatomic, strong) NSDictionary *ratings;
@property (nonatomic, assign) float averageRating;

@property (nonatomic, copy) NSString *movieThumbnailLink;
@property (nonatomic, strong) UIImage *movieThumbnail;

@property (nonatomic, strong) NSURL *reviewsURL;

@end
