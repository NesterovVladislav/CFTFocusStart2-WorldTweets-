//
//  TableViewCell.h
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property(nonatomic,readwrite) IBOutlet UILabel *name;
@property(nonatomic,readwrite) IBOutlet UILabel *login;
@property(nonatomic,readwrite) IBOutlet UILabel *lang;
@property(nonatomic,readwrite) IBOutlet UILabel *text;
@property(nonatomic,readwrite) IBOutlet UILabel *retweet_count;
@property(nonatomic,readwrite) IBOutlet UILabel *favorite_count;
@property(nonatomic,readwrite) IBOutlet UILabel *wasRetweet;
@property(nonatomic,readwrite) IBOutlet UILabel *https;
@property(nonatomic,readwrite) IBOutlet UILabel *date;
@property(nonatomic,readwrite) IBOutlet UIImageView *icon;
@property(nonatomic,readwrite) IBOutlet UIImageView *media;
@property(nonatomic,readwrite) IBOutlet UIImageView *retweetAction;

@end
