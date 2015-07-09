//
//  userInfoVC.h
//  iBank
//
//  Created by McKee on 15/6/16.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^USER_INFO_BLOCK) (UIImage *portrait, NSString *nickName);

@interface userInfoVC : UIViewController

@property (strong) USER_INFO_BLOCK block;

@property (weak) UIPopoverController *popover;

@end
