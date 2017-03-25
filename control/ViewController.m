//
//  ViewController.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "ViewController.h"
#import "Authorization.h"
#import "TokenAuthorization.h"
#import "LoadinfTwites.h"
#import "TableViewController.h"
#import "NSString+StringEncoding.h"
#import "AllertError.h"

@interface ViewController ()

@end

@implementation ViewController
{
    Authorization *authorization;
    TokenAuthorization *key;
    LoadinfTwites *loadTweet;
    TableViewController *table;
    AllertError *allerError;
    NSString *userName;
    NSString *loginForTable;
    
    IBOutlet UITextField *nameUser;
    IBOutlet UIButton *showButton;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
}
- (instancetype)initWithAppContext:(AppContext *)anAppContext
{
    assert(nil != anAppContext);
    
    self = [super initWithNibName:nil bundle:nil];
    
    _appContext = anAppContext;
    allerError = [[AllertError alloc] init];
    
    authorization = [[Authorization alloc] initWithAPIKey:[_appContext getAPIKey] apiSecret:[_appContext getAPIsecret]];
    
    authorization.delegate = self;
    
    [authorization request];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startActivityIndicator];
    });

    return self;
}

- (void)startActivityIndicator
{
    activityIndicator.hidden = NO;
    showButton.enabled = NO;
    nameUser.enabled = NO;
    [activityIndicator startAnimating];
}

- (void)stopActivityIndicator
{
    activityIndicator.hidden = YES;
    showButton.enabled = YES;
    nameUser.enabled = YES;
    [activityIndicator stopAnimating];
}

- (void)handleError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:[allerError getAllertWithError:error] animated:YES completion:nil];
    });
}

- (IBAction)authorization
{
    userName = [nameUser.text stringEncodingUrl];
    loginForTable = nameUser.text;
    
    loadTweet = [[LoadinfTwites alloc] initWithAuthorizate:key userName:nameUser.text countTweeta:10];
    loadTweet.delegate = self;
    [loadTweet request];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startActivityIndicator];
    });
}

- (void)finishLoadTweet:(NSArray<Tweet *> *)data error:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopActivityIndicator];
    });
    
    if( error != nil )
    {
        [self handleError:error];
    }
    else if( [data count] == 0 )
    {
        [self handleError:[NSError errorWithDomain:@"Sorry, write new name" code:0 userInfo:nil]];
    }
    else
    {
        NSArray<Tweet*>* tweets = data;
        dispatch_async(dispatch_get_main_queue(), ^{
            table = [[TableViewController alloc] initWithArrayTweet:tweets key:key name:loginForTable];
            [ self.navigationController pushViewController:table animated:YES ];
        });
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"МИР ТВИТОВ";
}

- (void)finishAuthorization:(TokenAuthorization *)authorize error:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopActivityIndicator];
    });
    
    if( error != nil )
    {
        [self handleError:error];
        dispatch_async(dispatch_get_main_queue(), ^{
            showButton.enabled = NO;
        });
    }
    else
    {
        key = authorize;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
