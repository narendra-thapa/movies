//
//  MovieDetailViewController.m
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "Movie.h"
#import "Review.h"
#import "ReviewManager.h"

@interface MovieDetailViewController ()

@property (nonatomic, strong) ReviewManager *reviewManager;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.detailMovieImage.image = self.movieSelected.movieThumbnail;
    self.movieTitle.text = self.movieSelected.title;
    self.detailYear.text = [NSString stringWithFormat:@"(%lu)", (unsigned long)self.movieSelected.year];
    self.detailSynopsis.text = self.movieSelected.synopsis;
    
    self.reviewManager = [[ReviewManager alloc] init];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = self.movieSelected.reviewsURL;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *jsonParsingError;
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            if (!jsonParsingError) {
                self.reviewManager.reviewDictionary = jsonData[@"reviews"];
                [self.reviewManager loadReviewsToArray];
            }
        }
    }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
