//
//  DataCenter.h
//  SimpleExample
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 yaoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (DataCenter*)sharedDataCenter;

@property (retain,nonatomic)  NSMutableArray * menuItems;

@end
