//
//  TableViewController.m
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "TableViewController.h"
#import "DataSoure.h"
#import "AllertError.h"

@interface TableViewController ()

@end

@implementation TableViewController
{
    IBOutlet UITableView *TableTwiter;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    UIRefreshControl *refreshControl;
    
    DataSoure *dataSourse;
    AllertError *allertError;
}
- (instancetype)initWithArrayTweet:(NSArray<Tweet *> *)aData key:(TokenAuthorization *)key name:(NSString *)userName
{
    self = [super initWithNibName:nil bundle:nil];
    
    dataSourse = [[DataSoure alloc] initWithArrayTweet:aData key:key name:userName];
    allertError = [[AllertError alloc] init];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        activityIndicator.hidden = YES;
    });
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ТВИТЫ";
    
    [self createRefreshControl];
    
    TableTwiter.dataSource = dataSourse;
    TableTwiter.delegate = dataSourse;
    
    [TableTwiter addSubview:refreshControl];
    
    dataSourse.delegate = self;
    TableTwiter.estimatedRowHeight = 40;
    TableTwiter.rowHeight = UITableViewAutomaticDimension;
    
}

-(void)createRefreshControl
{
    refreshControl = [[UIRefreshControl alloc] init];
    
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    NSString *textTitle = @"Обновление...";
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString: textTitle];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, textTitle.length)];
    refreshControl.attributedTitle = attrStr;
    refreshControl.tintColor = [UIColor blueColor];
    
}

- (void)startActivityIndicator
{
    activityIndicator.hidden = NO;
    [activityIndicator startAnimating];
}

- (void)stopActivityIndicator
{
    activityIndicator.hidden = YES;
    [activityIndicator stopAnimating];
}

- (void)refresh
{
    [dataSourse refreshDate];
}

- (void)startNextLoadingTweets
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startActivityIndicator];
    });
}

- (void)endNextLoadingTweetsWithError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopActivityIndicator];
    });
    
    if( error != nil )
    {
        [self handleError:error];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [TableTwiter reloadData];
        });
    }
}

- (void)endRefreshTweetsWithError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [refreshControl endRefreshing];
    });
    
    if( error != nil )
    {
        [self handleError:error];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [TableTwiter reloadData];
        });
    }
}

- (void)didLoadImageForIndex:(NSIndexPath *)index
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [TableTwiter beginUpdates];
        [TableTwiter reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
        [TableTwiter endUpdates];
    });
}

- (void)handleError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:[allertError getAllertWithError:error] animated:YES completion:nil];
    });
}

@end
