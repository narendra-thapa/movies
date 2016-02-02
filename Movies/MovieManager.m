//
//  MovieManager.m
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "MovieManager.h"
#import "Movie.h"


@implementation MovieManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _movieList = [[NSMutableArray alloc] init];
        _movieDictionary = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)loadMoviesToArray {
    
    for (NSDictionary *movies in self.movieDictionary) {
        Movie *movie = [[Movie alloc] init];
        
        movie.title = movies[@"title"];
        movie.year = [movies[@"year"] integerValue];
        movie.synopsis = movies[@"synopsis"];
        movie.ratings = movies[@"ratings"];
        movie.movieThumbnailLink = movies[@"posters"][@"original"];
        movie.mpaRating = movies[@"mpaa_rating"];
        movie.averageRating = ([movie.ratings[@"critics_score"] integerValue] + [movie.ratings[@"audience_score"] integerValue]) / 2.0;
        NSURL *poster = [NSURL URLWithString:movie.movieThumbnailLink];
        NSData *imageData = [NSData dataWithContentsOfURL:poster];
        movie.movieThumbnail = [UIImage imageWithData:imageData];
        
        NSString *tempReviewLink = movies[@"links"][@"reviews"];
        movie.reviewsURL = [NSURL URLWithString:[tempReviewLink stringByAppendingString:@"?apikey=c9zzxwtuc3q2tftqata3k59w"]];
        
        [self.movieList addObject:movie];
    }
}

- (void)displayMovieNames {
    
    for (Movie *movie in self.movieList) {
        NSLog(@"%@\n", movie.title);
        NSLog(@"%lu\n", (unsigned long)movie.year);
        NSLog(@"%@\n", movie.ratings);
        NSLog(@"%@\n", movie.synopsis);
        NSLog(@"%@", movie.movieThumbnailLink);
    }
    
}

- (Movie *)returnAMovie:(NSIndexPath *)indexPath {
    return [self.movieList objectAtIndex:indexPath.row];
}

- (NSUInteger)returnMovieCount {
    return self.movieList.count;
}

@end
