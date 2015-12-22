//
//  ZoneOneView.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/7.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "ZoneOneView.h"



@implementation ZoneOneView


@synthesize magazineArticles;

@synthesize magazine;

@synthesize magazineD;

@synthesize lb_title;

@synthesize magID;

@synthesize sortIndex;

@synthesize TableViewArticle;

@synthesize lb_pushDate;

@synthesize lb_pushNo;

@synthesize jsonResult;

@synthesize IsLoading;

@synthesize IsFetchMGIDing;

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self initView];
    
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma -mark 初始

-(void)initView
{


    jsonResult = [[JsonResult alloc] init];
    
    lb_title.text = [[magazine.data objectAtIndex:[sortIndex integerValue]] title];
    
  //  lb_pushNo.text = [[[magazine.data objectAtIndex:[sortIndex integerValue]] publishNo  ]  substringFromIndex:5];
    lb_pushNo.text = [NSString stringWithFormat:@"第%@期" , [Helpers  exchangeNtoC:[[[magazine.data objectAtIndex:[sortIndex integerValue]] publishNo  ]  substringFromIndex:5]]];

    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/mm/dd"];
    NSDate *date = [formatter dateFromString:[[magazine.data objectAtIndex:[sortIndex integerValue]] publishTime]];
    lb_pushDate.text = [formatter stringFromDate:date];
    
    [self GetMagazineArticles:@"0"];
   }


#pragma -mark 获取集合
-(void)GetMagazineArticles:(NSString *)detective
{
    [jsonResult GetMagazineArticles:magID detective:detective delegateControl:self] ;
    
    
    
    
}



#pragma -mark 按钮事件


//返回
-(IBAction)returnSuper:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}




//
-(IBAction)collect:(id)sender
{
    [Helpers showAlertMessage:@"收藏成功!"];
}


//分享

-(IBAction)share:(id)sender
{
    
    [self  performSegueWithIdentifier:@"segueShareSummary" sender:self];
    
}

//下一期
-(IBAction)nextMagazine:(id)sender
{
    IsFetchMGIDing = YES;
    [self GetMagazineArticles:@"2"];
}


//上一期
-(IBAction)preMagazine:(id)sender
{
    IsFetchMGIDing = YES;
    [self GetMagazineArticles:@"1"];
}


#pragma -mark tableviewdeledate

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return magazineArticles.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArticlesCell *cell = (ArticlesCell *)[tableView
                                          dequeueReusableCellWithIdentifier:@"ArticlesCell"];
    if([magazineArticles.data count]>0)
    {
        if([[magazineArticles.data objectAtIndex:indexPath.row] title])
        {
            cell.title.text = [[magazineArticles.data objectAtIndex:indexPath.row] title];
        }
        if([[magazineArticles.data objectAtIndex:indexPath.row] author] != nil)
        {
            cell.author.text = [@"作者:" stringByAppendingString: [[magazineArticles.data objectAtIndex:indexPath.row] author]];
        }
        if([[magazineArticles.data objectAtIndex:indexPath.row] keyword] !=nil)
        {
            cell.lb_keywords.text = [@"关键字:" stringByAppendingString: [[magazineArticles.data objectAtIndex:indexPath.row] keyword]];
            cell.lb_keywords.text = [cell.lb_keywords.text  stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
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
    [self  performSegueWithIdentifier:@"segueArticleSummary" sender:tableView];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([magazineArticles.data count] > 0) {
        
    
    MagazineArticlesData *magazineArticlesData= [magazineArticles.data objectAtIndex:TableViewArticle.indexPathForSelectedRow.row]  ;
        if([segue.identifier isEqualToString:@"segueArticleSummary"])
        {
        //  UITableView *tableview = (id)sender;
        
      
            [segue.destinationViewController setValue:magazineArticlesData.title forKey:@"title"];
            [segue.destinationViewController setValue:magazineArticlesData forKey:@"magazineArticlesData"];
        
        }
        if([segue.identifier isEqualToString:@"segueShareSummary"])
        {
            [segue.destinationViewController setValue:magazineArticlesData forKey:@"magazineArticlesData"];

        }
    }
}

#pragma mark NSURL
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    //        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    
    jsonResult.receiveData = [NSMutableData data];
    
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [jsonResult.receiveData appendData:data];
    
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (IsFetchMGIDing) {
        jsonResult.JsonString_LastMagazineCategory = [[NSString alloc]initWithData:jsonResult.receiveData encoding:NSUTF8StringEncoding];

        NSDictionary *dictionary = [ jsonResult.JsonString_LastMagazineCategory JSONValue];
        magazineD = [[Magazine alloc] initWithDictionary:dictionary];
        NSDecimalNumber  *f1 = (NSDecimalNumber *)magazineD.result;
        if((int)[f1 integerValue]==1)
        {
            
            magID = [NSString stringWithFormat:@"%d" ,(int)[[magazineD.data objectForKey:@"uid"] integerValue] ];
            IsFetchMGIDing = NO;
            [self GetMagazineArticles:@"0"];
            
            lb_pushNo.text = [NSString stringWithFormat:@"第%@期" , [Helpers  exchangeNtoC:[[magazineD.data  objectForKey:@"publishNo"]substringFromIndex:5]]];
            
            NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy/mm/dd"];
            NSDate *date = [formatter dateFromString:[magazineD.data  objectForKey:@"publishTime"]];
            lb_pushDate.text = [formatter stringFromDate:date];

        }
        else
        {
            [Helpers showAlertMessage:@"获取失败"];
        }

    }
    else
    {
        //异步请求完成数据会送完成后加载一次数据记录当前偏移量
        jsonResult.JsonString_MagazineArticles = [[NSString alloc]initWithData:jsonResult.receiveData encoding:NSUTF8StringEncoding];
        NSDictionary *dictionary = [jsonResult.JsonString_MagazineArticles JSONValue];
        magazineArticles = [[MagazineArticles alloc] initWithDictionary:dictionary];
        NSDecimalNumber  *f1 = (NSDecimalNumber *)magazineArticles.result;
        if((int)[f1 integerValue]==1)
        {
            
            [TableViewArticle reloadData];
        }
        else
        {
            [Helpers showAlertMessage:@"没有更多的文章"];
        }
    }
    
    
    
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    [Helpers showAlertMessage:@"获取失败,重新获取中"];
    [self GetMagazineArticles:@"0"];

}





@end
