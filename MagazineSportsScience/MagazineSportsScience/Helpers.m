//
//  Helpers.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/4.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Helpers.h"

@implementation Helpers

#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+(UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+(void)showAlertMessage:(NSString *)message
{
    [self showAlertMessage:message title:nil];
}

+(void)showAlertMessage:(NSString *)message title:(NSString  *)title;
{
    UIAlertView *theAlert;
    if (title==nil) {
      theAlert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                           message:message
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
    }
    else
    {
       theAlert = [[UIAlertView alloc] initWithTitle:title
                                                           message:message
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
    }

    [theAlert show];
    
    
}

+(NSString *)exchangeNtoC:(NSString *)pushno
{
    NSRange range = NSMakeRange(1, pushno.length-2);
    pushno = [pushno substringWithRange:range];
   // NSArray *arrayNumber = [[NSArray alloc] initWithObjects:@"0", @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
//    NSArray *arrayCWord = [[NSArray alloc] initWithObjects:@"零", @"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",nil];
    NSMutableDictionary *dic =  [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"0",@"零", @"1",@"一",@"2",@"二",@"3",@"三",@"4",@"四",@"5",@"五",@"6",@"六",@"7",@"七",@"8",@"八",@"9", @"九",@"10",@"十",nil] ;
    //int hundred = 0;
    int digit = 0;
    int tendigit = 0;
    
    //NSString *str = @"";
    
    NSString *strReplace =  @"";
    for (int i= (int)pushno.length-1;i>=0; i--) {
         strReplace = [dic objectForKey:[NSString stringWithFormat:@"%C" ,[pushno characterAtIndex:i ] ]];
        if(i== pushno.length-1)
        {
           if([strReplace isEqualToString:@"10"])
           {
               digit = 0;
               tendigit = 1*10;

               
           }
           else
           {
               digit = (int)[strReplace integerValue];
           }
            
        }
        else
        {
            tendigit = (int)[strReplace integerValue]*10;
        }
        
        
        
    }
    return [NSString stringWithFormat:@"%d",tendigit+digit];
}


+(NSString *)TrimString:(NSString *)str
{

    NSString *trimmedString = [str stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

@end