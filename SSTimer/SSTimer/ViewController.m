//
//  ViewController.m
//  SSTimer
//
//  Created by xingling xu on 2020/2/26.
//  Copyright © 2020 xingling xu. All rights reserved.
//

#import "ViewController.h"
#import "SSTimer.h"
#import "SecondViewController.h"

static int a = 1;

@interface ViewController ()
@property (nonatomic, strong) SSTimer *timer;
@end

@implementation ViewController {
    bool _value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First";
    self.view.backgroundColor = [UIColor whiteColor];
    // Use 1
//    self.timer = [[SSTimer alloc] initWithTimeInterval:1 interval:1 target:self selector:@selector(demo:) userInfo:nil repeats:YES];
//    _value = NO;
    
    // Use 2
    // self.timer = [SSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(demo:) userInfo:nil repeats:YES];
    
    // Use 3
//    self.timer = [SSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(SSTimer * _Nonnull timer) {
//        NSLog(@"hahahah");
//    }];
//    _value = YES;
}

- (void)demo:(SSTimer *)object {
    NSLog(@"~~~~~~~~~%@",object.userInfo);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    if (_value) {
//        [self.timer suspend];
//    } else {
//        [self.timer resume];
//    }
//    _value = !_value;
    SecondViewController *second = [SecondViewController new];
    second.value = a;
    [self.navigationController pushViewController:second animated:YES];
    a ++;
}


@end
