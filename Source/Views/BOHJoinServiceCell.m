//
//  BOHJoinServiceCell.m
//  BOHJoinServiceViewControllerExample
//
//  Created by Billy on 08/12/14.
//  Copyright (c) 2014 Billy Ohgren. All rights reserved.
//

#import "BOHJoinServiceCell.h"

@interface BOHJoinServiceCellTextField ()

@property (nonatomic, assign) UIEdgeInsets           textInset;

@end

@implementation BOHJoinServiceCellTextField

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _textInset = UIEdgeInsetsMake(5., 18., 0., 26.);
        self.textColor = [UIColor grayColor];
        self.font = [UIFont fontWithName:@"Avenir-Light" size:16.f];
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, _textInset);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, _textInset);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, _textInset);
}

@end

@interface BOHJoinServiceCell ()

@property (nonatomic, assign) BOHJoinServiceCellType type;

@end

@implementation BOHJoinServiceCell

- (instancetype)initWithType:(BOHJoinServiceCellType)type {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _type = type;
        if (type == BOHJoinServiceCellTypeButton) {
            [self.contentView addSubview:self.button];
        } else {
            [self.contentView addSubview:self.textField];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.type == BOHJoinServiceCellTypeButton) {
        self.button.bounds = self.contentView.bounds;
    } else {
        self.textField.bounds = self.contentView.bounds;
    }
    
}

#pragma mark - Properties

- (BOHJoinServiceCellTextField *)textField {
    if (!_textField) {
        _textField = [[BOHJoinServiceCellTextField alloc] initWithFrame:self.contentView.bounds];
        _textField.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    }
    return _textField;
}

- (void)setButton:(BOHJoinServiceButton *)button {
    if (_button != button) {
        if (_button.superview) {
            [_button removeFromSuperview];
        }
        _button = button;
        _button.bounds = self.contentView.bounds;
        [self.contentView addSubview:_button];
    }
}
@end
