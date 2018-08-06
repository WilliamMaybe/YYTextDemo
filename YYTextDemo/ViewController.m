//
//  ViewController.m
//  YYTextDemo
//
//  Created by maybe on 2018/8/7.
//  Copyright © 2018年 Maybe Zh. All rights reserved.
//

#import "ViewController.h"
#import <YYText/YYText.h>

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic ,strong) YYTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectInset(self.view.frame, 80, 80)];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentSize = self.view.frame.size;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        YYTextView *textView = [[YYTextView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        textView.backgroundColor = [UIColor whiteColor];
        [scrollView addSubview:textView];
        self.textView = textView;
    });
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.textView performSelector:@selector(scrollViewDidEndDecelerating:) withObject:self.textView]; 
}
    
@end
