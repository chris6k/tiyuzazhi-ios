//
//  FilterProcessControl.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/13.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "FilterProcessControl.h"

@implementation FilterProcessControl

@synthesize mutableArray;
@synthesize tableFilterProcess;
@synthesize tableRowIndex;
@synthesize step;
@synthesize role;

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    [self intiView];
    
}

-(void)intiView
{
    mutableArray = [[NSMutableArray alloc] initWithObjects:@"全部流程",@"收稿",@"初审",@"退修",@"外审",@"终审",nil];
    //     mutableArray = [[NSMutableArray alloc] initWithObjects:@"全部流程",@"0",@"收稿",@"6",@"初审",@"7" ,@"退修",@"10",@"外审",@"8",@"终审",@"24",nil];
    tableFilterProcess.delegate = self;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return mutableArray.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"filterOptionCell"];
    
    cell.textLabel.text = [mutableArray objectAtIndex:indexPath.row] ;
    
    return cell;
}


#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableRowIndex = indexPath.row;
    //    [self dismissViewControllerAnimated:YES completion:^{}];
    //  用户类型是P用户U编辑还是C主编。
    if([role isEqualToString: @"U"])
    {
        [self  performSegueWithIdentifier:@"unwindToEditorOfficeFromProcessCell" sender:tableView];
        
    }
    if([role isEqualToString: @"E"])
    {
        
        [self  performSegueWithIdentifier:@"unwindToSGZJFromProcessCell" sender:tableView];
        
    }
    if([role isEqualToString: @"C"])
    {
        
        [self  performSegueWithIdentifier:@"unwindToMasterEditorFromProcessCell" sender:tableView];
        
    }

    
}


#pragma mark - SEGUE


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    switch (tableRowIndex) {
        case 0:
            step = @"0";
            break;
        case 1:
            step = @"6";
            break;
        case 2:
            step = @"7";
            break;
        case 3:
            step = @"10";
            break;
        case 4:
            step = @"8";
            break;
        case 5:
            step = @"24";
            break;
        default:
            break;
    }
    
    
    [segue.destinationViewController setValue:step forKey:@"step"];
    
     
}


@end
