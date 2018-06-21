//
//  MenuItemEntity.m
//  SimpleExample
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 yaoh. All rights reserved.
//

#import "MenuItemEntity.h"

@implementation MenuItemEntity

-(id)initWithDic:(NSDictionary*)dic{
    
    if(self = [super init]){
        self.name = dic[@"name"];
        self.detail = dic[@"detail"];
        self.viewName = dic[@"viewname"];
        self.storyboard = dic[@"storyboard"];
        self.isNC = [[dic objectForKey:@"nc"] boolValue];
    }
    return self;
}

@end
