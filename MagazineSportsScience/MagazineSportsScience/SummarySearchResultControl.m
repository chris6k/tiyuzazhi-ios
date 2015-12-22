//
//  SummarySearchResultControl.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/14.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "SummarySearchResultControl.h"

@implementation SummarySearchResultControl

@synthesize articles;
@synthesize currentPage;
@synthesize keywords;
@synthesize tableSummaryResult;
JsonResult *jsonResult ;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}

-(void)initView
{
    jsonResult = [[JsonResult alloc] init];
    if (articles!=nil) {
        currentPage = 0;
        
    }
}


#pragma -mark tableviewdeledate

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return articles.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArticlesCell *cell = (ArticlesCell *)[tableView
                                          dequeueReusableCellWithIdentifier:@"ArticlesCell"];
    if([articles.data count]>0)
    {
//        cell.title.text = [[articles.data objectAtIndex:indexPath.row] title];
//        
//        cell.author.text = [[articles.data objectAtIndex:indexPath.row] author];
//        
//        
        
        if([[articles.data objectAtIndex:indexPath.row] title])
        {
            cell.title.text = [[articles.data objectAtIndex:indexPath.row] title];
        }
        if([[articles.data objectAtIndex:indexPath.row] author] != nil)
        {
            cell.author.text = [@"作者：" stringByAppendingString: [[articles.data objectAtIndex:indexPath.row] author]];
        }
        if([[articles.data objectAtIndex:indexPath.row] keyword] !=nil)
        {
            cell.lb_keywords.text = [@"关键字：" stringByAppendingString: [[articles.data objectAtIndex:indexPath.row] keyword]];
        }

    }
    
    
    if(indexPath.row%2==1)
    {
        cell.backgroundColor =  [Helpers colorWithHexString:@"f5f5f5"];
        
    }
    else
    {
        cell.backgroundColor =  [Helpers colorWithHexString:@"ffffff"];
        
    }
    return cell;
}



#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self  performSegueWithIdentifier:@"segueArticleSummaryFromSearch" sender:tableView];
    
}

#pragma mark - prepare

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueArticleSummaryFromSearch"])
    {
        UITableView *tableview = (id)sender;
        
        MagazineArticlesData *magazineArticlesData= [articles.data objectAtIndex:tableview.indexPathForSelectedRow.row]  ;
        
        [segue.destinationViewController setValue:magazineArticlesData forKey:@"magazineArticlesData"];
        
    }
}




#pragma mark - 按钮事件
- (IBAction)returnSuper:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (IBAction)DoSearchPre:(id)sender {
    
    if (currentPage == 0) {
        [Helpers showAlertMessage:@"没有更多文章"];
    }
    else
    {
        currentPage = currentPage-1;
        [jsonResult GetSummarySearchResult:keywords index:(int)currentPage];
        NSDictionary *dictionary = [jsonResult.JsonString_SummarySearchResult JSONValue];
        articles = [[MagazineArticles alloc] initWithDictionary:dictionary];
        NSDecimalNumber  *f1 = (NSDecimalNumber *)articles.result;
        if((int)[f1 integerValue]==1)
        {
            [tableSummaryResult reloadData];
        }
        else
        {
            currentPage = currentPage+1;
            [Helpers showAlertMessage:@"获取失败"];
        }
    }
    
}

- (IBAction)DoSearchNext:(id)sender {
    currentPage = currentPage+1;
    [jsonResult GetSummarySearchResult:keywords index:(int)currentPage];
    NSDictionary *dictionary = [jsonResult.JsonString_SummarySearchResult JSONValue];
    articles = [[MagazineArticles alloc] initWithDictionary:dictionary];
    NSDecimalNumber  *f1 = (NSDecimalNumber *)articles.result;
    if((int)[f1 integerValue]==1)
    {
        if(articles.data.count ==0)
        {
            [Helpers showAlertMessage:@"没有更多文章"];
        }
        else{
        [tableSummaryResult reloadData];
        }
    }
    else
    {
        currentPage = currentPage-1;
        [Helpers showAlertMessage:@"获取失败"];
    }
    
}
@end
