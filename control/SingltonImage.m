//
//  SingltonImage.m
//  control
//
//  Created by Nesterov on 16/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "SingltonImage.h"

@implementation SingltonImage
{
    UIImage *image;
    NSString *singltonName;
}

static SingltonImage * singlton = nil;

+ (SingltonImage *)sharedInstanceWithImageURL:(NSString *)imageUrl userName:(NSString *)userName
{
    assert(nil != imageUrl);
    assert(nil != userName);
    assert(NO == [imageUrl isEqualToString:@""]);
    assert(NO == [userName isEqualToString:@""]);
    
    if( singlton == nil )
    {
        singlton = [[SingltonImage alloc] init];
        [singlton writeName:userName];
        [singlton loadImage:imageUrl];
    }
    else if( NO == [singlton equalToName:userName] )
    {
        [singlton writeName:userName];
        [singlton loadImage:imageUrl];
    }
    
    return singlton;
}

- (BOOL)equalToName:(NSString *)name
{
    return [singltonName isEqualToString:name];
}

- (void)writeName:(NSString *)name
{
    singltonName = name;
}

- (void)loadImage:(NSString *)imageUrl
{
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    image = [[UIImage alloc] initWithData:data];
}

- (UIImage *)getImage
{
    return image;
}

@end
