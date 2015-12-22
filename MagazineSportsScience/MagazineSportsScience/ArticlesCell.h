//
//  ArticlesCell.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/7.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticlesCell : UITableViewCell



@property (nonatomic, retain) IBOutlet UILabel *title;

@property (nonatomic, retain) IBOutlet UILabel *author;

@property (nonatomic, retain) IBOutlet UILabel *lb_pushtime;


@property (weak, nonatomic) IBOutlet UILabel *lb_keywords;

@end
