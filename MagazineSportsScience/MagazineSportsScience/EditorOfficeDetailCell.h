//
//  EditorOfficeDetailCell.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/13.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorOfficeDetailCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIView *viewContain;

@property (weak, nonatomic) IBOutlet UILabel *lb_Number;

@property (weak, nonatomic) IBOutlet UILabel *lb_state;

@property (weak, nonatomic) IBOutlet UILabel *lb_info;

@property (weak, nonatomic) IBOutlet UIButton *btn_arrow;

@property (weak, nonatomic) IBOutlet UIImageView *img_state;

@property (weak, nonatomic) IBOutlet UIImageView *img_viewstate;

@property (weak, nonatomic) IBOutlet UILabel *lb_comment;


@property (weak, nonatomic) IBOutlet UILabel *lb_timespot;

@property (weak, nonatomic) IBOutlet UILabel *lb_partment;

@property (weak, nonatomic) IBOutlet UILabel *lb_detailstate;

@property (weak, nonatomic) IBOutlet UILabel *lb_detailcomment;


@end
