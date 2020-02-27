//
//  ViewController.m
//  SSTimer
//
//  Created by xingling xu on 2020/2/26.
//  Copyright © 2020 xingling xu. All rights reserved.
//

#import "ViewController.h"
#import "SSTimer.h"

@interface ViewController ()
@property (nonatomic, strong) SSTimer *timer;
@property (nonatomic, strong) YYTimer *yyTimer;
@end

@implementation ViewController {
    bool _value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timer = [SSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(demo:) userInfo:nil repeats:YES];
    _value = YES;
}

- (void)demo:(id)object {
    NSLog(@"~~~~~~~~~");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_value) {
        [self.timer suspend];
    } else {
        [self.timer resume];
    }
    _value = !_value;
}
@end
