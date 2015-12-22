//
//  ShareView.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/7.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagazineEntity.h"
@interface ShareView : UIViewController


@property (weak, nonatomic) MagazineArticlesData *magazineArticlesData;

@property (weak, nonatomic) NSString *shareTag;

@property (weak, nonatomic) IBOutlet UIView *shareContainView;

@property (weak, nonatomic) IBOutlet UIView *shareBorderView;
- (IBAction)returnSuper:(id)sender;
- (IBAction)DoShare:(id)sender;
- (IBAction)unwindShareViewController:(UIStoryboardSegue *)segue ;
@end
