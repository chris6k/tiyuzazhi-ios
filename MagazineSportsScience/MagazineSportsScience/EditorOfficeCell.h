//
//  EditorOfficeCell.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/10.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorOfficeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewContain;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UIImageView *bk_contain;
@property (weak, nonatomic) IBOutlet UIImageView *bk_image;
@property (weak, nonatomic) IBOutlet UILabel *lb_dealman;
@property (weak, nonatomic) IBOutlet UILabel *lb_pno;
@property (weak, nonatomic) IBOutlet UILabel *lb_time;
@property (weak, nonatomic) IBOutlet UILabel *lb_summary;

@end
