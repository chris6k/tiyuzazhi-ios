//
//  SummarySearchResultControl.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/14.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "MagazineEntity.h"
#import "JsonResult.h"
#import "Helpers.h"
#import "ArticlesCell.h"
#import "PullingRefreshTableView/PullingRefreshTableView.h"


@interface SummarySearchResultControl : UIViewController

@property (nonatomic, strong)  MagazineArticles *articles;

@property (weak, nonatomic) IBOutlet UITableView *tableSummaryResult;

@property ( strong, nonatomic) NSString *keywords;
@property (nonatomic,assign) NSInteger currentPage;



- (IBAction)returnSuper:(id)sender;


- (IBAction)DoSearchPre:(id)sender;


- (IBAction)DoSearchNext:(id)sender;


@end
