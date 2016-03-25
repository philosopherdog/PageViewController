//
//  ImageObject.h
//  PageViewController
//
//  Created by steve on 2016-03-25.
//  Copyright © 2016 steve. All rights reserved.
//

@import UIKit;

@interface ImageObject : NSObject
- (instancetype)initWithImageName:(NSString *)name;
@property (nonatomic, strong) UIImage *image;
@end
