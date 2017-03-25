//
//  AllertError.m
//  control
//
//  Created by Student on 25.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "AllertError.h"

@implementation AllertError
{
}
- (instancetype)init
{
    self = [super init];
    
    return self;
}

- (UIAlertController *)getAllertWithError:(NSError *)error
{
    UIAlertController *allert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
    [allert addAction:actionCancel];
    
    return allert;
}

@end
