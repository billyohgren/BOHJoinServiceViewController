//
//  BOHJoinServiceButton.h
//  BOHJoinServiceViewControllerExample
//
//  Created by Billy on 08/12/14.
//  Copyright (c) 2014 Billy Ohgren. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BOHJoinServiceButtonType) {
    BOHJoinServiceButtonTypeDefault,
    BOHJoinServiceButtonTypeFacebook,
    BOHJoinServiceButtonTypeTwitter
};

@interface BOHJoinServiceButton : UIButton

- (instancetype)initWithType:(BOHJoinServiceButtonType)type;

@end
