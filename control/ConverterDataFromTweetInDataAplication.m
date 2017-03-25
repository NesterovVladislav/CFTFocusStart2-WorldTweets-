//
//  ConverterDataFromTweetInDataAplication.m
//  control
//
//  Created by Nesterov on 19/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "ConverterDataFromTweetInDataAplication.h"

@implementation ConvertDataTweetInDataApp
{
    NSDictionary *language;
}
- (instancetype)init
{
    self = [super init];
    language = @{
                 @"ru" :@"русский",
                 @"en" :@"английский",
                 @"kz":@"казахски",
                 @"fr":@"французкий",
              };

    return self;
}

- (NSString *)convertDateTweetInDateApp:(NSString *)date
{
    assert(nil != date);
    assert(NO == [date isEqualToString:@""]);
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"E MMM d HH:mm:ssZ yyyy"];
    
    NSDate *dateWriteTweet = [dateFormater dateFromString:date];
    
    dateFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_Ru"];
    [dateFormater setDateStyle:NSDateFormatterFullStyle];
    [dateFormater setTimeStyle:NSDateFormatterShortStyle];
    dateFormater.doesRelativeDateFormatting =YES;
    
    return [dateFormater stringFromDate:dateWriteTweet];
}

- (NSString *)languageTweetForLangIdentificator:(NSString *)ident
{
    assert(nil != ident);
    assert(NO == [ident isEqualToString:@""]);
    
    NSArray *arrayKey = [language allKeys];
    
    NSString *languageTweetString = @"Язык твита";
    
    if( NO != [arrayKey containsObject:ident] )
    {
        return [NSString stringWithFormat:@"%@ %@",languageTweetString, [language objectForKey:ident]];
    }
    else
    {
        return [NSString stringWithFormat:@"%@ %@",languageTweetString, ident];
    }
}

- (UIImage *)scaleImgPropoWidth:(UIImage *)image scaledToSize:(CGSize)newSize
{
    assert(nil != image);
    
    double ratio;
    double delta;
    
    ratio = newSize.width / image.size.width;
    delta = (ratio*image.size.height - ratio*image.size.width);
    
    UIImage *scaledImage = [UIImage imageWithCGImage:[image CGImage] scale:(image.scale / ratio) orientation:(image.imageOrientation)];
    
    CGRect clipRect = CGRectMake(0, 0, scaledImage.size.width,
                                 scaledImage.size.height);
    
    CGSize sz = CGSizeMake(newSize.width, scaledImage.size.height);
                           
    if( [[UIScreen mainScreen] respondsToSelector:@selector(scale)] )
    {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    }
    else
    {
        UIGraphicsBeginImageContext(sz);
    }
    
    UIRectClip(clipRect);
    
    [image drawInRect:clipRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (NSRange)seacherUrlInMesage:(NSString *)mesage url:(NSString *)url;
{
    NSRange range;
    
    if( nil != url )
    {
         range = [mesage rangeOfString:url];
    }
    else
    {
        range.length = 0;
    }
    
    return range;
}

@end
