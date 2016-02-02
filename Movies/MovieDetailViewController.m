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
#import "ReviewCell.h"
#import "ReviewHeader.h"

@interface MovieDetailViewController ()

@property (nonatomic, strong) ReviewManager *reviewManager;

@property (nonatomic, strong) UICollectionViewFlowLayout *reviewLayout;

@property (weak, nonatomic) IBOutlet UICollectionView *reviewCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *reviewFLowLayout;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.detailMovieImage.image = self.movieSelected.movieThumbnail;
//    self.movieTitle.text = self.movieSelected.title;
//    self.detailYear.text = [NSString stringWithFormat:@"(%lu)", (unsigned long)self.movieSelected.year];
//    self.detailSynopsis.text = self.movieSelected.synopsis;
    
    self.reviewManager = [[ReviewManager alloc] init];
    
    self.reviewLayout = [[UICollectionViewFlowLayout alloc] init];
    self.reviewLayout.itemSize = CGSizeMake(300, 200);
    self.reviewLayout.minimumInteritemSpacing = 2;
    self.reviewLayout.minimumLineSpacing = 3;
    //self.reviewLayout.headerReferenceSize = CGSizeMake(150, 30);
    
    self.reviewCollectionView.collectionViewLayout = self.reviewLayout;
    
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
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.reviewCollectionView reloadData];
                });
            }
        }
    }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.reviewManager returnReviewCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ReviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReviewCell" forIndexPath:indexPath];
    Review *currentReview = [self.reviewManager returnAReview:indexPath];
    cell.reviewCritic.text = currentReview.critic;
    cell.reviewDate.text = currentReview.date;
    cell.reviewScore.text = currentReview.score;
    cell.reviewFreshness.text = currentReview.freshness;
    cell.reviewPublication.text = currentReview.publication;
    cell.reviewQuote.text = currentReview.quote;
    
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ReviewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeader" forIndexPath:indexPath];
    header.reviewHeaderImage.image = self.movieSelected.movieThumbnail;
    header.reviewHeaderTitle.text = self.movieSelected.title;
    header.reviewHeaderYear.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.movieSelected.year];
    header.reviewHeaderSynopsis.text = self.movieSelected.synopsis;
    
    return header;
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
