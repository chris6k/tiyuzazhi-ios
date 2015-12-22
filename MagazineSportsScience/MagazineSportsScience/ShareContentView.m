//
//  ShareContentView.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/25.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "ShareContentView.h"

@implementation ShareContentView

@synthesize textContent;

@synthesize btn_share;
@synthesize magazineArticlesData;
@synthesize shareTag;


-(void)viewDidLoad
{
    [super viewDidLoad];
    textContent.text = magazineArticlesData.title;
}

- (IBAction)DoShare:(id)sender {
    
    
    NSInteger tag = [shareTag integerValue];
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"测试一下"
                                                image:nil
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];

    switch (tag) {
        case 1: //QQ
            //定制QQ空间信息
            [publishContent addQQSpaceUnitWithTitle:NSLocalizedString(@"TEXT_HELLO_QZONE", textContent.text)
                                                url:INHERIT_VALUE
                                               site:nil
                                            fromUrl:nil
                                            comment:INHERIT_VALUE
                                            summary:INHERIT_VALUE
                                              image:INHERIT_VALUE
                                               type:INHERIT_VALUE
                                            playUrl:nil
                                               nswb:nil];
            [ShareSDK shareContent:publishContent
                              type:ShareTypeQQ
                       authOptions:nil
                      shareOptions:nil
                     statusBarTips:YES
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                                
                            }];
            

            break;
        case 2: //RENREN
            [publishContent addRenRenUnitWithName:NSLocalizedString(@"TEXT_HELLO_RENREN", textContent.text)
                                      description:INHERIT_VALUE
                                              url:INHERIT_VALUE
                                          message:INHERIT_VALUE
                                            image:INHERIT_VALUE
                                          caption:nil];
            [ShareSDK shareContent:publishContent
                              type:ShareTypeRenren
                       authOptions:nil
                      shareOptions:nil
                     statusBarTips:YES
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                                
                            }];

            break;
        case 3://WEIXIN
            //定制微信好友信息
            [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
                                                 content:INHERIT_VALUE
                                                   title:NSLocalizedString(@"TEXT_HELLO_WECHAT_SESSION", textContent.text)
                                                     url:INHERIT_VALUE
                                              thumbImage:nil
                                                   image:INHERIT_VALUE
                                            musicFileUrl:nil
                                                 extInfo:nil
                                                fileData:nil
                                            emoticonData:nil];
            [ShareSDK shareContent:publishContent
                              type:ShareTypeWeixiTimeline
                       authOptions:nil
                      shareOptions:nil
                     statusBarTips:YES
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                                
                            }];

            break;
        case 4://WEIBO
            
            //构造分享内容
            publishContent = [ShareSDK content:textContent.text
                                defaultContent:textContent.text
                                         image:nil
                                         title:@"ShareSDK"
                                           url:@"http://www.mob.com"
                                   description:@"这是一条测试信息"
                                     mediaType:SSPublishContentMediaTypeNews];

            [ShareSDK shareContent:publishContent
                              type:ShareTypeSinaWeibo
                       authOptions:nil
                      shareOptions:nil
                     statusBarTips:YES
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                                
                            }];

            break;
        case 5://KONGJIAN
            //定制QQ空间信息
            [publishContent addQQSpaceUnitWithTitle:NSLocalizedString(@"TEXT_HELLO_QZONE", textContent.text)
                                                url:INHERIT_VALUE
                                               site:nil
                                            fromUrl:nil
                                            comment:INHERIT_VALUE
                                            summary:INHERIT_VALUE
                                              image:INHERIT_VALUE
                                               type:INHERIT_VALUE
                                            playUrl:nil
                                               nswb:nil];
            [ShareSDK shareContent:publishContent
                              type:ShareTypeQQSpace
                       authOptions:nil
                      shareOptions:nil
                     statusBarTips:YES
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                                
                            }];
            

            
            break;
        case 6://DOUBAN
            publishContent = [ShareSDK content: textContent.text
                                defaultContent: textContent.text
                                         image:nil
                                         title:@"ShareSDK"
                                           url:@"http://www.mob.com"
                                   description:@"这是一条测试信息"
                                     mediaType:SSPublishContentMediaTypeNews];
            [ShareSDK shareContent:publishContent
                              type:ShareTypeDouBan
                       authOptions:nil
                      shareOptions:nil
                     statusBarTips:YES
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                                
                            }];


            break;
            
        default:
            
            break;
    }
   
   //    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK" ofType:@"png"];
//    
//    //构造分享内容
//    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
//                                       defaultContent:@"测试一下"
//                                                image:[ShareSDK imageWithPath:imagePath]
//                                                title:@"ShareSDK"
//                                                  url:@"http://www.mob.com"
//                                          description:@"这是一条测试信息"
//                                            mediaType:SSPublishContentMediaTypeNews];
//    //创建弹出菜单容器
//    id<ISSContainer> container = [ShareSDK container];
//    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
//    
//    //弹出分享菜单
//    [ShareSDK showShareActionSheet:container
//                         shareList:nil
//                           content:publishContent
//                     statusBarTips:YES
//                       authOptions:nil
//                      shareOptions:nil
//                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                                
//                                if (state == SSResponseStateSuccess)
//                                {
//                                    NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
//                                }
//                                else if (state == SSResponseStateFail)
//                                {
//                                    NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
//                                }
//                            }];
}






@end
