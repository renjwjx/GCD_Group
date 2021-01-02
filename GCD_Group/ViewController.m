//
//  ViewController.m
//  GCD_Group
//
//  Created by renjinwei on 2020/12/31.
//  Copyright © 2020 renjinwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dispatchGroup];
}

- (void)dispatchGroup
{
    dispatch_queue_t queue = dispatch_queue_create("GCD group", DISPATCH_QUEUE_PRIORITY_DEFAULT);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"group1 task");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"group2 task");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"group3 task");
    });
    //group task complete, then notify 
    dispatch_group_notify(group, queue, ^{
        NSLog(@"group notify end");
    });
}

@end
