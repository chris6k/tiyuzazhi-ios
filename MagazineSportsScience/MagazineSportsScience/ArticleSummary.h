//
//  ArticleSummary.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonResult.h"
#import "MagazineEntity.h"
#import "JsonResult.h"
#import "Helpers.h"
#import "UIView+Toast.h"

@interface ArticleSummary : UIViewController<NSURLConnectionDataDelegate>
{
    
    UIWebView *webView;

}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString *summaryID;
@property (nonatomic, strong)  MagazineArticlesData *magazineArticlesData;
@property (nonatomic, strong)  Summary *summary;
@property (weak, nonatomic) IBOutlet UIButton *btnReturn;
@property (weak, nonatomic) IBOutlet UIButton *btnDown;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_author;
@property (weak, nonatomic) IBOutlet UITextView *textArea;
@property (weak, nonatomic) IBOutlet UIWebView *showView;
@property (nonatomic, strong) NSString *attchID;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (nonatomic, copy) NSString *pageFlag;
@property (nonatomic, strong) NSMutableData *receiveData;




#pragma -mark 按钮事件


//返回
-(IBAction)returnSuper:(id)sender;

//
-(IBAction)downloadPDF:(id)sender;

@end
