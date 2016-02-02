//
//  ViewController.m
//  Movies
//
//  Created by Narendra Thapa on 2016-02-01.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "ViewController.h"
#import "MovieManager.h"
#import "MovieCell.h"
#import "Movie.h"
#import "MovieDetailViewController.h"


@interface ViewController ()

@property (nonatomic, strong) MovieManager *movieManager;
@property (nonatomic, strong) UICollectionViewFlowLayout *movieLayout;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewLayout;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.movieManager = [[MovieManager alloc] init];
    
    self.movieLayout = [[UICollectionViewFlowLayout alloc] init];
    self.movieLayout.itemSize = CGSizeMake(300, 100);
    self.movieLayout.minimumInteritemSpacing = 2;
    self.movieLayout.minimumLineSpacing = 3;
    self.movieLayout.headerReferenceSize = CGSizeMake(150, 30);
    
    self.collectionView.collectionViewLayout = self.movieLayout;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=c9zzxwtuc3q2tftqata3k59w";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *jsonParsingError;
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            if (!jsonParsingError) {
                //NSLog(@"%@", jsonData);
                self.movieManager.movieDictionary = jsonData[@"movies"];
                [self.movieManager loadMoviesToArray];
                [self.movieManager displayMovieNames];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.collectionView reloadData];
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


#pragma mark - Segue to Detail View
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        
        
        NSIndexPath *movieSelected = [self.collectionView indexPathForCell:sender];
        Movie *selectedMovie = [self.movieManager returnAMovie:movieSelected];
        MovieDetailViewController *movieDVC = (MovieDetailViewController *)[segue destinationViewController];
        movieDVC.movieSelected = selectedMovie;
        
    }
}

#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //return [self.photoManager returnSectionCount];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.movieManager returnMovieCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    Movie *currentMovie = [self.movieManager returnAMovie:indexPath];
    cell.movieImageView.image = currentMovie.movieThumbnail;
    cell.movieTitle.text = currentMovie.title;
    cell.movieYear.text = [NSString stringWithFormat:@"(%lu)", (unsigned long)currentMovie.year];
    cell.movieRating.text = [NSString stringWithFormat:@"Average Rating: %.1f%%", currentMovie.averageRating];
    return cell;
}



//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    CollectionReusableHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeader" forIndexPath:indexPath];
//    Photo *currentImage = [self.photoManager returnAPhoto:indexPath];
//    if (self.photoManager.section == 0) {   header.sectionHeader.text = currentImage.group;}
//    else if (self.photoManager.section == 1) {  header.sectionHeader.text = currentImage.location;}
//    return header;
//}


@end
