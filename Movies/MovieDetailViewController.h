//
//  MovieDetailViewController.h
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *detailMovieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailYear;
@property (weak, nonatomic) IBOutlet UILabel *detailSynopsis;


@property (nonatomic, strong) Movie *movieSelected;

//-(void) showMovieImage:(Movie *)selectedMovie;

@end
