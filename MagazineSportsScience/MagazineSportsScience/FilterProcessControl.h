//
//  FilterProcessControl.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/13.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterProcessControl : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic)  NSMutableArray *mutableArray ;
@property (weak, nonatomic) IBOutlet UITableView *tableFilterProcess;
@property (assign, nonatomic) NSInteger tableRowIndex;
@property (weak, nonatomic)  NSString *step ;
@property (weak, nonatomic)  NSString *role ;
@end
