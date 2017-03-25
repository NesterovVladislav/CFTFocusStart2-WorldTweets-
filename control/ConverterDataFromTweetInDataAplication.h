//
//  ConverterDataFromTweetInDataAplication.h
//  control
//
//  Created by Nesterov on 19/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConvertDataTweetInDataApp : NSObject

- (instancetype)init;

- (UIImage *)scaleImgPropoWidth:(UIImage *)image scaledToSize:(CGSize)newSize;

- (NSString *)convertDateTweetInDateApp:(NSString *)date;
- (NSString *)languageTweetForLangIdentificator:(NSString *)ident;
- (NSRange)seacherUrlInMesage:(NSString *)mesage url:(NSString *)url;
@end
