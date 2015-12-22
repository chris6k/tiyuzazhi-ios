//
//  ShareContentView.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/25.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagazineEntity.h"

#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"

#import "WeiboSDK.h"
#import <RennSDK/RennSDK.h>


@interface ShareContentView : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_share;
@property (weak, nonatomic) IBOutlet UITextView *textContent;

@property (weak, nonatomic) MagazineArticlesData *magazineArticlesData;
@property (weak, nonatomic) NSString *shareTag;
- (IBAction)DoShare:(id)sender;

@end
