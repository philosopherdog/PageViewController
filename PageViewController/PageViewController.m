//
//  PageViewController.m
//  PageViewController
//
//  Created by steve on 2016-03-25.
//  Copyright © 2016 steve. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"
#import "ImageObject.h"

@interface PageViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@end

@implementation PageViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    ViewController *vc = [self createViewControllerAtIndex:0];
    [self setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    ImageObject *obj = [[ImageObject alloc] initWithImageName:@"1"];
    vc.obj = obj;
}

// private method
- (ViewController *)createViewControllerAtIndex:(NSInteger)index {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.index = index;
    return vc;
}



@end
