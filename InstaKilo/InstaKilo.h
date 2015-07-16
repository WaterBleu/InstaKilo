//
//  InstaKilo.h
//  InstaKilo
//
//  Created by Jeff Huang on 2015-07-16.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InstaKilo : NSObject

@property (nonatomic) UIImage* image;
@property (nonatomic) NSString* subject;
@property (nonatomic) NSString* location;

typedef NS_ENUM(NSInteger, GroupType){
    Subject,
    Location,
};

- (instancetype)initWithImage:(UIImage*) image
                   andSubject:(NSString*) subject
                  andLocation:(NSString*) location;

@end
