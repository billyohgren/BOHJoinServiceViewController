//
//  BOHJoinServiceCell.h
//  BOHJoinServiceViewControllerExample
//
//  Created by Billy on 08/12/14.
//  Copyright (c) 2014 Billy Ohgren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BOHJoinServiceButton.h"

typedef NS_ENUM(NSUInteger, BOHJoinServiceCellType) {
    BOHJoinServiceCellTypeTextField,
    BOHJoinServiceCellTypeButton
};

@interface BOHJoinServiceCellTextField : UITextField
@end

@interface BOHJoinServiceCell : UITableViewCell

@property (nonatomic, strong) BOHJoinServiceCellTextField *textField;
@property (nonatomic, strong) BOHJoinServiceButton        *button;

- (instancetype)initWithType:(BOHJoinServiceCellType)type;

@end
