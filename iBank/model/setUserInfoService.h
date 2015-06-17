//
//  setUserInfoService.h
//  iBank
//
//  Created by McKee on 15/6/17.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "wbConn.h"

typedef void(^SET_USER_INFO_BLOCK) (int code, id data);

@interface setUserInfoService : wbConn

@property NSString *nickName;

@property NSString *password;

@property (strong) SET_USER_INFO_BLOCK setUserInfoBlock;

@end
