//
//  Constants.h
//  InHelper
//
//  Created by Sheng Ling on 3/2/16.
//  Copyright © 2016 yaoh. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define LS(str) NSLocalizedString(str, @"")
#define ISIOS8() ([[[UIDevice currentDevice]systemVersion] floatValue] >= 8)
#define ISIPAD() ([[UIDevice currentDevice] userInterfaceIdiom] != UIUserInterfaceIdiomPhone)
#define ISiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

static NSString * const kFileMenu       =  @"menu.json";

#endif /* Constants_h */
