//
//  DataSoure.m
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "DataSoure.h"
#import "TableViewCell.h"
#import "Tweet.h"
#import "ConverterDataFromTweetInDataAplication.h"
#import "NSArray+SeachMinID.h"
#import "HeightCell.h"
#import "NetWork.h"

static NSString * const REUSE_IDENTIFIER = @"twite";
static NSInteger const countTweetInRequest = 10;

@implementation DataSoure
{
    NSMutableArray<Tweet *> *arrayTweet;
    NSMutableDictionary *setImage;
    NSMutableDictionary *heightCellAtIndex;

    NSString  *login;
    NSRange range;
    NSInteger lastIndexTweet;
    
    UIImage *image;
    UIImage *imageLoading;

    LoadinfTwites *loadTweet;
    ConvertDataTweetInDataApp *converData;
    
    BOOL flagForData;
    BOOL flagToRefersh;
    CGFloat  height;
    
}

- (instancetype)initWithArrayTweet:(NSArray<Tweet *> *)aData key:(TokenAuthorization *)key name:(NSString *)userName
{
    assert(nil != aData);
    assert(nil != key);
    assert(nil != userName);
    assert(NO == [userName isEqualToString:@""]);
    
    self = [ super init ];
    
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"loading" ofType:@"jpg"];
    imageLoading = [[UIImage alloc] initWithContentsOfFile:thePath];
    
    converData = [[ConvertDataTweetInDataApp alloc] init];
    heightCellAtIndex = [[NSMutableDictionary alloc] init];
    loadTweet = [[LoadinfTwites alloc] initWithAuthorizate:key userName:userName countTweeta:countTweetInRequest];
    
    arrayTweet = [aData copy];
    setImage = [[NSMutableDictionary alloc] init];
    
    login = [userName copy];
    
    loadTweet.delegate = self;
    
    flagForData = NO;
    flagToRefersh = NO;
   
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayTweet count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeightCell *heightCell = [[HeightCell alloc] initWithHeight:cell.frame.size.height];

    [heightCellAtIndex setObject:heightCell forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeightCell *heightCell = [heightCellAtIndex objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
 
    if( nil != heightCell )
    {
        return heightCell.height;
    }
    return UITableViewAutomaticDimension;
}

- (void)finishLoadTweet:(NSArray<Tweet *> *)data error:(NSError *)error
{
    if( error != nil )
    {
        [self.delegate endNextLoadingTweetsWithError:error];
    }
    else{
        if( NO != flagToRefersh )
        {
             NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:data];
            [tmpArray addObjectsFromArray:arrayTweet];
            arrayTweet = [tmpArray copy];
            
            [self.delegate endRefreshTweetsWithError:nil];
        }
        else
        {
            NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:arrayTweet];
            [tmpArray addObjectsFromArray:data];
            arrayTweet = [tmpArray mutableCopy];
            [self.delegate endNextLoadingTweetsWithError:nil];
        }
    }
}

- (void)loadingMediaImageToKey:(NSString *)keyImage image:(UIImage *) mediaImage widthImage:(CGFloat) widthImage indexPath:(NSIndexPath *)index
{
    image = [converData scaleImgPropoWidth:mediaImage scaledToSize:CGSizeMake(widthImage, widthImage)];
    [setImage setObject:image forKey:keyImage];
        [self.delegate didLoadImageForIndex:index];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER];
    
    if( nil == cell )
    {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil].firstObject;
    }
    
    Tweet * twiter = arrayTweet[indexPath.row];
  
    if( NO != twiter.wasRetweet )
    {
        cell.wasRetweet.text = [NSString stringWithFormat:@"%@%@",login, @" сделал(а) ретвит"];
        cell.wasRetweet.hidden = NO;
        cell.retweetAction.hidden = NO;
    }
    else
    {
        cell.wasRetweet.hidden = YES;
        cell.retweetAction.hidden = YES;
    }
    
    cell.media.image = nil;
   if( nil != twiter.entities.media )
   {
        NSString *urlImage = twiter.entities.media.media_url_https;
       
        if( nil != [setImage objectForKey:urlImage] )
        {
                cell.media.image = [setImage objectForKey:urlImage];
        }
        else
        {
            CGFloat widht = tableView.contentSize.width;
           
            cell.media.image =  [converData scaleImgPropoWidth:imageLoading scaledToSize:CGSizeMake(widht, widht)];
            
            typeof(self) __weak weakSelf =self;

            [NetWork loadingImageFromUrl:urlImage complitionHandler:^(UIImage *mediaImage) {
                [weakSelf loadingMediaImageToKey:urlImage image:mediaImage widthImage:widht indexPath:indexPath];
            }];
   
        }
    }
    
    cell.name.text = twiter.user.name;
    cell.login.text =twiter.user.screen_name;
    
    cell.lang.text = [converData languageTweetForLangIdentificator:twiter.lang];
    cell.date.text = [converData convertDateTweetInDateApp:twiter.created_at];
    
    range = [converData seacherUrlInMesage:twiter.text url:twiter.entities.urls.url];
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] initWithString:twiter.text];
    
    if( 0!= range.length )
    {
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, range.location)];
    }
    else
    {
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, twiter.text.length)];
    }
     cell.text.attributedText = attrStr;

    cell.retweet_count.text = [NSString stringWithFormat:@"%ld", twiter.retweet_count];
    cell.favorite_count.text =  [NSString stringWithFormat:@"%ld", twiter.favorite_count];
    
    cell.icon.image = twiter.user.imageUser;
    
    if( indexPath.row == [arrayTweet count] - 1 )
    {
        flagForData = YES;
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    CGFloat deltaOffset = maximumOffset - currentOffset;
    
    if( deltaOffset  <= 0 )
    {
        if( NO != flagForData )
        {
            flagForData = NO;
            
            [self.delegate startNextLoadingTweets];
            
            [loadTweet requestNextTweetsWithMaxID:[NSArray seachMinIDInArrayTweet:[arrayTweet copy]]-1];
        }
    }
}

- (void)refreshDate
{
    flagToRefersh = YES;
    
    [loadTweet requestPullToRefreshID:[arrayTweet firstObject].id];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    _selectTwite = arrayTweet[indexPath.row];
    
    if( nil != _selectTwite.entities.urls.url )
    {
        NSURL *urlForSafari =[NSURL URLWithString:_selectTwite.entities.urls.url];
        
        [[UIApplication sharedApplication] openURL:urlForSafari options:@{} completionHandler:nil ];
    }

}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
