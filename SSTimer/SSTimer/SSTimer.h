//
//  SSTimer.h
//  SSTimer
//
//  Created by xingling xu on 2020/2/26.
//  Copyright © 2020 xingling xu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSTimer : NSObject

/// 同下面的方法，不过自动开始执行
+ (SSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

/// 创建一个定时器并返回，但是并不会自动执行，需要手动调用resume方法
/// - parameter:  start 定时器启动时间
/// - parameter:  ti    间隔多久开始执行selector
/// - parameter:  s     执行的任务
/// - parameter:  ui    绑定信息
/// - parameter:  rep   是否重复
- (instancetype)initWithTimeInterval:(NSTimeInterval)start interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep;

/// 扩充block
+ (SSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(SSTimer *timer))block;

/// 启动
- (void)resume;

/// 暂定
- (void)suspend;

/// 关闭
- (void)invalidate;

@property (readonly) BOOL repeats;
@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;
@property (nullable, readonly, retain) id userInfo;

@end

NS_ASSUME_NONNULL_END
