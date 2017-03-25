//
//  NetWork.m
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//
#import "NetWork.h"
#import "RequestContext.h"
#import "Parser.h"
#import "ResponseParserDictionary.h"
#import "ResponseParserAvtorization.h"
#import "ResponseParserTwiter.h"
#import "SuperParser.h"
#import "ErrorForParsingJSON.h"
#import "SuperError.h"

@interface NetWork()<NSURLSessionDelegate>
@end

@implementation NetWork
{
    NSURLSession *session;
    NSMutableURLRequest *request;
    Class expectedClass;
    SuperParser *superParser;
}
- (instancetype)init
{
    self = [super init];
    
    request = [[NSMutableURLRequest alloc] init];
    superParser = [[SuperParser alloc] init];
    
    return self;
}

- (void)writeHeaderRequest:(RequestContext *)context
{
    [context.headerRequest enumerateKeysAndObjectsUsingBlock:^(NSString *obj, NSString *key)
    {
        [request setValue:obj forHTTPHeaderField:key];
    }];
}

- (void)createRequest:(RequestContext *)context
{
    [request setURL:[NSURL URLWithString:context.url]];
    [request setHTTPMethod:context.httpMethod];
    
    [self writeHeaderRequest:context];
    
    if( context.typeResult == ResultTypeAvtorization )
    {
        [request setHTTPBody:context.httpBody];
    }
}

- (void)requestContext:(RequestContext *)context complition:(NetWorkHandler)completion
{
    assert(nil != context);

    _responsParser = [superParser objectForKey:context.typeResult];
    expectedClass = context.expectedClass;
    [self createRequest:context];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession  sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    typeof(self) __weak weakSelf = self;
    
    NSURLSessionDataTask *task;
    task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if( nil != error )
        {
            completion(error, nil);
            return;
        }
        [weakSelf parseData:data completion:completion];
    }];
    
    [task resume];
}

- (NSError *)chekJsonForError:(id)json
{
    SuperError *error = (SuperError *)[[superParser objectForKey: ResultTypeDictionary] parserResponse:json expected:[SuperError class]];
    
    return [error convertToNSError];
}

- (void)parseData:(NSData *)data completion:(NetWorkHandler)completion
{
    NSError *error = nil;

    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if( nil != error)
    {
        completion(error, nil);
        return;
    }

    NSError *jsonContentError = [self chekJsonForError:json];
    
    if( nil != jsonContentError )
    {
        completion(jsonContentError, nil);
        return;
    }
    
    completion(nil, [_responsParser parserResponse:json expected:expectedClass]);
}

+ (void)loadingImageFromUrl:(NSString *)urlImage complitionHandler:(void(^)(UIImage * mediaImage))complitionHandler
{
    NSURL *url = [NSURL URLWithString:urlImage];
    
    NSURLSessionDataTask *downloadTask =[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        complitionHandler([[UIImage alloc] initWithData:data]);
    }];
    
    [downloadTask resume];

}

@end
