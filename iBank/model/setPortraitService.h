//
//  setPortraitService.h
//  iBank
//
//  Created by McKee on 15/6/17.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

#import "wbConn.h"

typedef void(^SET_PORTRAIT_BLOCK) (int code, id data);

@interface setPortraitService : wbConn

@property UIImage *portrait;

@property (strong) SET_PORTRAIT_BLOCK setPortraitBlock;

@end
