//
//  MenuEntity.h
//  SimpleExample
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 yaoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuEntity : NSObject

@property (nonatomic, retain) NSString  *name;
@property (nonatomic, retain) NSString  *detail;
@property (nonatomic, retain) NSMutableArray  *items;

-(id)initWithDic:(NSDictionary*)dic;

@end
