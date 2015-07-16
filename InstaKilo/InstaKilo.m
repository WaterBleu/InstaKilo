//
//  InstaKilo.m
//  InstaKilo
//
//  Created by Jeff Huang on 2015-07-16.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import "InstaKilo.h"
#import <UIKit/UIKit.h>

@interface InstaKilo ()

@end

@implementation InstaKilo

- (instancetype)initWithImage:(UIImage*) image
                   andSubject:(NSString*) subject
                  andLocation:(NSString*) location
{
    self = [super init];
    if (self) {
        self.image = image;
        self.subject = subject;
        self.location = location;
    }
    return self;
}

@end
