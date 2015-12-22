//
//  CategoryCell.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/3.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#ifndef MagazineSportsScience_CategoryCell_h
#define MagazineSportsScience_CategoryCell_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface CategoryCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *title;

@property (nonatomic, retain) IBOutlet UILabel *subTitle;



@property (nonatomic, retain) IBOutlet UIView *cateImage1;

@property (nonatomic, retain) IBOutlet UIView *cateImage2;



@property (nonatomic, retain) IBOutlet UILabel *lb_pushno;


@property (nonatomic, retain) IBOutlet UILabel *lb_pushtime;

@end

#endif
