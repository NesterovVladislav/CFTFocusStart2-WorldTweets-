//
//  Twite.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "Tweet.h"


@interface Tweet()

@property (nonatomic, readwrite) NSInteger id;
@property (nonatomic, readwrite) NSInteger favorite_count;
@property (nonatomic, readwrite) NSInteger retweet_count;

@property (nonatomic, copy, readwrite) NSString *source;
@property (nonatomic, copy, readwrite) NSString *lang;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, copy, readwrite) NSString *created_at;

@property (nonatomic, strong, readwrite) User *user;
@property (nonatomic, strong, readwrite) Entities *entities;
@property (nonatomic, strong, readwrite) RetweetedStatus * retweeted_status;

@end

@implementation Tweet
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"id: %lu\nfavorite_count: %lu\nretweet_count: %lu\nsourse: %@\nlang: %@\ntext: %@\ncreated_at %@\nuser %@nentities %@nretweeted_status %@",  (unsigned long) _id, (unsigned long) _favorite_count, (unsigned long) _retweet_count, _source, _lang, _text, _created_at, @"user",@"entities",@"retweeted_status"];

}

- (void)appendagwInformation
{
    _wasRetweet = NO;
    
    NSString *userName = _user.name;
    
    if( _retweeted_status != nil )
    {
        _wasRetweet = YES;
        _user = _retweeted_status.user;
        _text = _retweeted_status.text;
        _entities = _retweeted_status.entities;
    }
    
    [_user addImageUserOrRetweetUser:_wasRetweet nameUser:userName];
    
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
               [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(id)) className:nil],
               [[PropertyInfo alloc]initWithMethod: NSStringFromSelector(@selector(favorite_count)) className:nil],
               [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(retweet_count)) className:nil],
               [[PropertyInfo alloc]initWithMethod: NSStringFromSelector(@selector(source))className:[NSString class]],
               [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(lang)) className:[NSString class]],
               [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(text)) className:[NSString class]],
               [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(created_at)) className:[NSString class]],
               [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(user)) className:[User class]],
               [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(entities)) className:[Entities class]],
               [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(retweeted_status)) className:[RetweetedStatus class]]
             ];
}

@end
