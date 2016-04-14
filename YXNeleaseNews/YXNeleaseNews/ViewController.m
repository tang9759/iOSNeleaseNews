//
//  ViewController.m
//  YXNeleaseNews
//
//  Created by AS on 4/13/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "ViewController.h"
#import "YXHeadLine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [YXHeadLine loadHeadLineWithSuccess:^(NSArray *headLines) {
       NSLog(@"-----%@",headLines);
   } WithFailed:^(NSError *error) {
       
   }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
