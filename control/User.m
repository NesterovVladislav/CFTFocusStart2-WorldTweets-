//
//  User.m
//  control
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "User.h"
#import "SingltonImage.h"

@interface User()

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screen_name;
@property (nonatomic, copy, readwrite) NSString *profile_image_url;

@end

@implementation User
{
    UIImage * icon;
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)loadImage
{
    NSURL *url = [NSURL URLWithString:_profile_image_url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    icon = [[UIImage alloc] initWithData:data];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"name: %@\nprofile_image_url: %@nscreen_name %@",  _name, _profile_image_url,_screen_name];
    
}

- (UIImage *)imageUser
{
    if( icon != nil )
    {
        return icon;
    }
    else
    {
        assert(NO);
    }
}
- (void)addImageUserOrRetweetUser:(BOOL)userOrRetweetUser nameUser:(NSString *)name
{
    assert(nil != name);
    assert(NO == [name isEqualToString:@""]);
    
    if( userOrRetweetUser == YES )
    {
        [self loadImage];
    }
    else
    {
        icon = [[SingltonImage sharedInstanceWithImageURL:_profile_image_url userName:name] getImage];
    }
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
            [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(name))className:[NSString class]],
            [[PropertyInfo alloc]initWithMethod: NSStringFromSelector(@selector(profile_image_url)) className:[NSString class]],
            [[PropertyInfo alloc]initWithMethod: NSStringFromSelector(@selector(screen_name)) className:[NSString class]]
             ];
}

@end

