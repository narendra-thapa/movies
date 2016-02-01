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
@property (nonatomic, assign) NSUInteger year;
@property (nonatomic, copy) NSString *synopsis;
@property (nonatomic, strong) NSDictionary *ratings;

@property (nonatomic, copy) NSString *movieThumbnailLink;
@property (nonatomic, strong) UIImage *movieThumbnail;

@property (nonatomic, strong) NSURL *reviewsURL;



@end
