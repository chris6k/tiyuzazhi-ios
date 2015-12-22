//
//  Helpers.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/4.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#ifndef MagazineSportsScience_Helpers_h
#define MagazineSportsScience_Helpers_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface Helpers : NSObject

+(UIColor *) colorWithHexString: (NSString *)color;

+(void)showAlertMessage:(NSString *)message;
+(void)showAlertMessage:(NSString *)message title:(NSString  *)title;
+(NSString *)exchangeNtoC:(NSString *)pushno;
+(NSString *)TrimString:(NSString *)str;


@end


#endif
