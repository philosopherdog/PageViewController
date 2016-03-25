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
@property (nonatomic, strong) NSArray<ImageObject*>*data;

@end

@implementation PageViewController


- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self createData];
    }
    return self;
}

- (void)createData {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i < 11; ++i) {
        NSString *name = [@(i) stringValue];
        ImageObject *obj = [[ImageObject alloc] initWithImageName:name];
        [result addObject:obj];
    }
    self.data = [result copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    ViewController *vc = [self createViewControllerAtIndex:0];
    vc.obj = self.data[0];
    [self setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

// private method
- (ViewController *)createViewControllerAtIndex:(NSInteger)index {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.index = index;
    return vc;
}

#pragma mark - Data Source


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = ((ViewController *)viewController).index;
    if (index >= self.data.count -1) {
        return nil;
    }
    index += 1;
    ViewController *vc = [self createViewControllerAtIndex:index];
    ImageObject *obj = self.data[index];
    vc.obj = obj;
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = ((ViewController *)viewController).index;
    if (index <= 0) {
        return nil;
    }
    index -= 1;
    ViewController *vc = [self createViewControllerAtIndex:index];
    vc.obj = self.data[index];
    return vc;
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.data.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return ((ViewController *)pageViewController.viewControllers[0]).index;
}
















@end
