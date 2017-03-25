//
//  NetWork.h
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RequestContext;
@protocol Parser;

typedef void (^NetWorkHandler)(NSError * error, id data);

@interface NetWork : NSObject

@property (nonatomic, strong, readonly) id<Parser> responsParser;

- (instancetype)init;

- (void)requestContext:(RequestContext *)context complition:(NetWorkHandler)completion;

+ (void)loadingImageFromUrl:(NSString *)urlImage complitionHandler:(void(^)(UIImage * image))complitionHandler;

@end
