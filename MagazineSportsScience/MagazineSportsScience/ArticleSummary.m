//
//  ArticleSummary.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "ArticleSummary.h"

@implementation ArticleSummary


@synthesize summaryID;
@synthesize title;
@synthesize magazineArticlesData;
@synthesize summary;
@synthesize btnReturn;
@synthesize lb_title;
@synthesize lb_author;
@synthesize textArea;
@synthesize btnDown;
@synthesize showView;
@synthesize bottomBar;
@synthesize pageFlag;
@synthesize receiveData;
@synthesize attchID;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)initView
{
    
    if(summary != nil)
    {
        if([summary.data  objectForKey:@"title"] !=nil)
        {
        lb_title.text = [summary.data  objectForKey:@"title"] ;
        }
        lb_title.numberOfLines = 0;
        if([summary.data  objectForKey:@"author"]  !=nil)
        {
        lb_author.text = [NSString stringWithFormat:@"作者    %@",[summary.data  objectForKey:@"author"]  ] ;
        }
       
        if([summary.data  objectForKey:@"summary"] != nil)
        {
            NSString *html = [NSString stringWithFormat:@"<font color='#00367e' vert>[摘要]</font>    %@",[summary.data  objectForKey:@"summary"]  ];
            [showView loadHTMLString:html baseURL:nil];
            
        }

        
        if (pageFlag !=nil) {
            bottomBar.alpha =1;
        }
        else
        {
            bottomBar.alpha =0;
          

        }
        
        
        
        
    }
    else
    {
        lb_title.text = magazineArticlesData.title;
        lb_title.numberOfLines = 0;
        
        lb_author.text = [NSString stringWithFormat:@"作者:  %@",magazineArticlesData.author] ;
        
        NSString *html = [NSString stringWithFormat:@"<font color='#00367e' vert>[摘要]</font>    %@",magazineArticlesData.summary ] ;
        
        [showView loadHTMLString:html baseURL:nil];
        if (pageFlag !=nil) {
            bottomBar.alpha =1;
        }
        else
        {
            bottomBar.alpha =0;
                        
            
        }

    }
    
}


#pragma -mark 按钮事件


//返回
-(IBAction)returnSuper:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

//下载
-(IBAction)downloadPDF:(id)sender
{
    [self.view makeToast:@"正在下载"
                duration:1.0
                position:CSToastPositionBottom
                   title:@"提示"];

  //  JsonResult *jsonResult = [[JsonResult alloc] init];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
   attchID = [formatter stringFromNumber: magazineArticlesData.attachment ];
//  
//    
    NSString *urlstr =[ @"http://www.cisszgty.cn:85/v2/article.do?op=download&id=" stringByAppendingString:attchID  ];

  //  urlstr = @"http://www.pdf995.com/samples/pdf.pdf";
    NSURL *remoteTextFileUrl = [NSURL URLWithString:urlstr];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:remoteTextFileUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //第三步，连接服务器
    [NSURLConnection  connectionWithRequest:request delegate:self];
    

    //new

    
    
}


#pragma mark NSURL
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    // NSLog(@"%@",[res allHeaderFields]);
    self.receiveData = [NSMutableData data];
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSMutableString *path = [[NSMutableString alloc] initWithString:documentsDirectory];
    NSString *savePath = [NSString stringWithFormat: @"%@.pdf",attchID];
    [path appendString:savePath];
    
    NSString *FileName=[documentsDirectory stringByAppendingPathComponent:savePath];
    [receiveData writeToFile:FileName atomically:YES];
    
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    UIButton *btnClose =[ UIButton buttonWithType:UIButtonTypeCustom];
    btnClose.frame = CGRectMake(self.view.frame.size.width-40 ,30, 20, 20) ;
    [btnClose setBackgroundImage:[UIImage imageNamed:@"btn_close2.png"] forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(ClosePopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [webView loadData:receiveData MIMEType:@"application/pdf"  textEncodingName:@"UTF-8" baseURL:nil];
  
    [self.view addSubview:webView];
    [webView   addSubview:btnClose];
    

    [self.view makeToast:@"下载完毕"
                duration:1.0
                position:CSToastPositionBottom
                   title:@"提示"];
    
}

-(NSString *)readFile:(NSString *)fileName

{
    NSLog(@"readFile");
    
    NSString *appFile = fileName;
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:appFile])
    {
        NSError *error= NULL;
        NSString *resultData = [NSString stringWithContentsOfFile: appFile encoding: NSUTF8StringEncoding error: &error];
        if (error == NULL)
            return resultData;
    }
    return NULL;
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    [Helpers showAlertMessage:@"下载失败"];
}


#pragma mark - 关闭弹出框
-(IBAction)ClosePopBtnClick:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]])
    {
        [webView removeFromSuperview];
    }
}

@end
