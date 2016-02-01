//
//  MovieManager.h
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Movie;

@interface MovieManager : NSObject

@property (nonatomic, strong) NSMutableArray *movieList;
@property (nonatomic, strong) NSDictionary *movieDictionary;

- (void)loadMoviesToArray;
- (void)displayMovieNames;

- (Movie *)returnAMovie:(NSIndexPath *)indexPath;

- (NSUInteger)returnMovieCount;

@end
