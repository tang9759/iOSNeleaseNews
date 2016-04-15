//
//  YXHeadLineViewController.m
//  YXNeleaseNews
//
//  Created by AS on 4/14/16.
//  Copyright © 2016 AS. All rights reserved.
//

#import "YXHeadLineViewController.h"
#import "YXHeadLine.h"

#import "YXLoopView.h"
@interface YXHeadLineViewController ()
/**
 *  新闻头条数组
 */
@property(nonatomic,strong)NSArray * headLines;
@end

@implementation YXHeadLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载头条数据
    [YXHeadLine loadHeadLineWithSuccess:^(NSArray *headLines) {
        if (headLines.count == 0)return;
        // 图片数组
        NSArray *imgs = [headLines valueForKeyPath:@"imgscr"];
        // 新闻标题
        NSArray *titles = [headLines valueForKeyPath:@"title"];
        // 创建无限轮播器
        YXLoopView *loopView = [[YXLoopView alloc]initWithURLs:imgs titles:titles didSelected:^(NSInteger index) {
            [UIApplication sharedApplication].keyWindow.rootViewController = nil;
        }];
        
        // 设置frame
        loopView.frame = self.view.bounds;
        // 添加到控制器的view上
        [self.view addSubview:loopView];
        
    } WithFailed:^(NSError *error) {
        
    }];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
