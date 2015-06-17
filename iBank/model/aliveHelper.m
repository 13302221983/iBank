//
//  aliveHelper.m
//  iBank
//
//  Created by McKee on 15/4/21.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

#import "aliveHelper.h"
#import "dataHelper.h"
#import "keepAliveService.h"

@interface aliveHelper ()
{
    NSTimer *_keepAliveTimer;
    NSTimer *_timeoutCheckingTimer;
    BOOL _returned;
    keepAliveService *_keepAliveSrv;
}

@property BOOL returned;

@end

@implementation aliveHelper

+ (instancetype)helper
{
    static aliveHelper *helper = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void){
        helper = [[aliveHelper alloc] init];
    });
    return helper;
}

- (instancetype)init
{
    self = [super init];
    if( self ){
        _returned = YES;
        __weak aliveHelper *weakSelf = self;
        _keepAliveSrv = [[keepAliveService alloc] init];
        _keepAliveSrv.keepAliveBlock = ^(NSInteger code, NSString *data){
            if( code == 1 && [data isKindOfClass:[NSString class]] ){
                // 成功
                NSString *countString = (NSString*)data;
                NSArray *counts = [countString componentsSeparatedByString:@","];
                NSString *systemMsgCount = counts.lastObject;
                NSString *userMsgCount = counts.firstObject;
                if( systemMsgCount.intValue > 0 ){
                    [[dataHelper helper].qrySystemMsgListSrv request];
                }
                if( userMsgCount.intValue > 0 ){
                    [[dataHelper helper].qryUserMsgListSrv request];
                }
            }
            else{
                // -1:未知类型错误
                // -1001:参数无效
                // -1201:用户会话不存在
                // -1202:用户会话过期
                [dataHelper helper].sessionTimeout = YES;
            }
//            [dataHelper helper].sessionTimeout = YES;
            weakSelf.returned = YES;
        };
    }
    return self;
}


- (void)startKeepAlive
{
    if( ![dataHelper helper].sessionid ){
        return;
    }
    _keepAliveTimer = [NSTimer scheduledTimerWithTimeInterval:self.inteval target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

- (void)stopKeepAlive
{
    [_keepAliveTimer invalidate];
}

- (void)fire
{
    if( _timeoutCheckingTimer ) [_timeoutCheckingTimer fire];
    if( _keepAliveTimer ) [_keepAliveTimer fire];
}

- (void)onTimer:(NSTimer*)timer
{
    if( [dataHelper helper].sessionTimeout ) return;
    if( !_returned ) return;
    if( timer == _keepAliveTimer )
    {
        [_keepAliveSrv request];
    }
    else if( timer == _timeoutCheckingTimer ){
        NSTimeInterval timestamp = [NSDate date].timeIntervalSince1970;
        if( timestamp - [dataHelper helper].lastTouchTimestamp > [dataHelper helper].timeoutInterval * 60 ){
            [dataHelper helper].sessionTimeout = YES;
        }
        if( ![[dataHelper helper] checkSessionTimeout] )
        {
            [self stopTimoutChecking];
        }
    }
}

- (void)startTimoutChecking
{
    if( ![dataHelper helper].sessionid ){
        return;
    }
    _timeoutCheckingTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

- (void)stopTimoutChecking
{
    [_timeoutCheckingTimer invalidate];
}

@end
