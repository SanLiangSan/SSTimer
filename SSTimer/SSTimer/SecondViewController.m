
//
//  SecondViewController.m
//  SSTimer
//
//  Created by xingling xu on 2020/2/28.
//  Copyright © 2020 xingling xu. All rights reserved.
//

#import "SecondViewController.h"
#import "SSTimer.h"

@interface SecondViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) SSTimer *sTimer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second";
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(demo:) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    self.sTimer = [[SSTimer alloc] initWithTimeInterval:0 interval:1 target:self selector:@selector(demo1:) userInfo:nil repeats:YES];
    [self.sTimer resume];
}

- (void)viewWillDisappear:(BOOL)animated {
//    [self.timer invalidate];
//    self.timer = nil;
}

- (void)demo:(NSTimer *)timer {
    NSLog(@"a is %ld",self.value);
}

- (void)demo1:(SSTimer *)timer {
    NSLog(@"a is %ld",self.value);
}

- (void)dealloc {
    NSLog(@"dealloc is %ld",self.value);
}



@end
