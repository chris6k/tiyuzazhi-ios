//
//  JastorRuntimeHelper.h
//  MagazineSportsScience
//
//  Created by joan on 14/11/29.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#ifndef MagazineSportsScience_JastorRuntimeHelper_h
#define MagazineSportsScience_JastorRuntimeHelper_h
@interface JastorRuntimeHelper : NSObject {
    
}
+ (BOOL)isPropertyReadOnly:(Class)klass propertyName:(NSString*)propertyName;
+ (Class)propertyClassForPropertyName:(NSString *)propertyName ofClass:(Class)klass;
+ (NSArray *)propertyNames:(Class)klass;

@end

#endif
