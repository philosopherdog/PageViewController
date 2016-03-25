//
//  ViewController.m
//  PageViewController
//
//  Created by steve on 2016-03-25.
//  Copyright © 2016 steve. All rights reserved.
//

#import "ViewController.h"
#import "ImageObject.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setObj:(ImageObject *)obj {
    _obj = obj;
    self.imageView.image = self.obj.image;
}

@end
