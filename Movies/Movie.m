//
//  Movie.m
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ratings = [[NSDictionary alloc] init];
    }
    return self;
}

@end
