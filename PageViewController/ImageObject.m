//
//  ImageObject.m
//  PageViewController
//
//  Created by steve on 2016-03-25.
//  Copyright © 2016 steve. All rights reserved.
//

#import "ImageObject.h"

@implementation ImageObject

- (instancetype)initWithImageName:(NSString *)name {
    if (self = [super init]) {
        _image = [UIImage imageNamed:name];
    }
    return self;
}

- (instancetype)init {
    return [self initWithImageName:@"1"];
}

@end
