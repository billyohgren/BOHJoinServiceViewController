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
    [self setTitle:NSLocalizedString(@"Connect with Facebook", @"Connect with Facebook title") forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.backgroundColor = [UIColor colorWithRed:62.f/255.f green:89.f/255.f blue:152.f/255.f alpha:1.0f];
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.f];
}

- (void)applyTwitterStyle {
    self.backgroundColor = [UIColor greenColor];
}

@end
