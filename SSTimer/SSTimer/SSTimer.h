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

+ (SSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

- (instancetype)initWithTimeInterval:(NSTimeInterval)start interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep;

- (void)resume;

- (void)suspend;

- (void)invalidate;

@property (readonly) BOOL repeats;
@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;
@property (nullable, readonly, retain) id userInfo;

@end

NS_ASSUME_NONNULL_END
