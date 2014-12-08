//
//  BOHJoinServiceButton.m
//  BOHJoinServiceViewControllerExample
//
//  Created by Billy on 08/12/14.
//  Copyright (c) 2014 Billy Ohgren. All rights reserved.
//

#import "BOHJoinServiceButton.h"

@interface BOHJoinServiceButton ()

@property (nonatomic, assign) BOHJoinServiceButtonType type;

@end

@implementation BOHJoinServiceButton

- (instancetype)initWithType:(BOHJoinServiceButtonType)type {
    self = [super init];
    if (self) {
        _type = type;
        self.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
        [self setupButtonWithType:_type];
    }
    return self;
}

- (void)setupButtonWithType:(BOHJoinServiceButtonType)type {
    switch (type) {
        case BOHJoinServiceButtonTypeDefault:{
            [self applyDefaultStyle];
        }break;
        case BOHJoinServiceButtonTypeFacebook:{
            [self applyFacebookStyle];
        }break;
        case BOHJoinServiceButtonTypeTwitter:{
            [self applyTwitterStyle];
        }break;
        default:
            break;
    }
}


#pragma mark - Style methods

- (void)applyDefaultStyle {
    self.backgroundColor = [UIColor blueColor];
}

- (void)applyFacebookStyle {
    self.backgroundColor = [UIColor redColor];
}

- (void)applyTwitterStyle {
    self.backgroundColor = [UIColor greenColor];
}

@end
