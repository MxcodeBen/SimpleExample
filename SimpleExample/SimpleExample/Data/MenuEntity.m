//
//  MenuEntity.m
//  SimpleExample
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 yaoh. All rights reserved.
//

#import "MenuEntity.h"
#import "MenuItemEntity.h"

@implementation MenuEntity

-(id)initWithDic:(NSDictionary*)dic{
    
    if(self = [super init]){
        self.name = dic[@"name"];
        self.detail = dic[@"detail"];
        
        self.items = [NSMutableArray new];
        if (dic[@"items"]) {
            for (NSDictionary * cDic in dic[@"items"]) {
                if(cDic[@"items"]){
                    [self.items addObject:[[MenuEntity alloc] initWithDic:cDic]];
                }
                else {
                    [self.items addObject:[[MenuItemEntity alloc] initWithDic:cDic]];
                }
            }
        }
    }
    return self;
}

@end
