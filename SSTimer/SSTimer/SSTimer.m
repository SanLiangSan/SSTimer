//
//  SSTimer.m
//  SSTimer
//
//  Created by xingling xu on 2020/2/26.
//  Copyright © 2020 xingling xu. All rights reserved.
//

#import "SSTimer.h"

#define lock(...) \
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);\
    __VA_ARGS__;\
    dispatch_semaphore_signal(_semaphore);

@implementation SSTimer {
    BOOL _valid;
    NSTimeInterval _timeInterval;
    BOOL _repeats;
    __weak id _target;
    SEL _selector;
    dispatch_source_t _source;
    dispatch_semaphore_t _semaphore;
    dispatch_block_t _block;
    id _userInfo;
}

+ (SSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    SSTimer *timer = [[SSTimer alloc] initWithTimeInterval:0 interval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [timer resume];
    return timer;
}

- (instancetype)initWithTimeInterval:(NSTimeInterval)start interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep {
    self = [super init];
    if (self) {
        _valid = YES;
        _timeInterval = ti;
        _repeats = rep;
        _target = t;
        _selector = s;
        _userInfo = ui;
        _semaphore = dispatch_semaphore_create(1);
        __weak typeof(self) weakSelf = self;
        _source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(_source, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), ti * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(_source, ^{[weakSelf fire];});
    }
    return self;
}

- (void)fire {
    if (!_valid) {return;}
    lock(id target = _target;)
    if (!target) {
        [self invalidate];
    } else {
        // 执行selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:_selector withObject:self];
#pragma clang diagnostic pop
        if (!_repeats) {
            [self invalidate];
        }
    }
}

- (void)resume {
    dispatch_resume(_source);
}

- (void)suspend {
    dispatch_suspend(_source);
}

- (void)invalidate {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    if (_valid) {
        dispatch_source_cancel(_source);
        _source = NULL;
        _target = nil;
        _valid = NO;
    }
    dispatch_semaphore_signal(_semaphore);
}

- (id)userInfo {
    lock(id ui = _userInfo) return ui;
}

- (BOOL)repeats {
    lock(BOOL re = _repeats) return re;
}

- (NSTimeInterval)timeInterval {
    lock(NSTimeInterval ti = _timeInterval) return ti;
}

- (BOOL)isValid {
    lock(BOOL va = _valid) return va;
}


@end
