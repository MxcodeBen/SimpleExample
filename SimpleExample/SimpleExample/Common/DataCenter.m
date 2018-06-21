//
//  DataCenter.m
//  SimpleExample
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 yaoh. All rights reserved.
//

#import "DataCenter.h"
#import "MenuEntity.h"

@implementation DataCenter

+ (DataCenter*)sharedDataCenter {
    static DataCenter * house=nil;
    @synchronized(self) {
        if(!house) {
            house = [[DataCenter alloc] init];
        }
    }
    return house;
}

- (id)init {
    if (self = [super init]) {

    }
    return self;
}

//菜单项
-(NSMutableArray*)menuItems{
    if (_menuItems) {
        return _menuItems;
    }
    NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kFileMenu];
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attrs = [fileManager attributesOfItemAtPath:filePath error:&error];
    
    NSString * jsonStr;
    if (attrs != nil && [attrs count] > 0) {
        NSDate *date = [attrs valueForKey:@"NSFileModificationDate"];
        if (date != nil) {
            jsonStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        }
    }
    
    _menuItems = [[NSMutableArray alloc]init];
    if (jsonStr) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
        NSArray* vcArrays = [dic objectForKey:@"items"];
        if (vcArrays) {
            for (int i = 0; i < vcArrays.count; i++) {
                NSDictionary* subDic = vcArrays[i];
                [_menuItems addObject:[[MenuEntity alloc] initWithDic:subDic]];
            }
        }
    }
    return _menuItems;
}

@end
