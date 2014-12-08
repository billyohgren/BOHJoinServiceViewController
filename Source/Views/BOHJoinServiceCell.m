//
//  BOHJoinServiceCell.m
//  BOHJoinServiceViewControllerExample
//
//  Created by Billy on 08/12/14.
//  Copyright (c) 2014 Billy Ohgren. All rights reserved.
//

#import "BOHJoinServiceCell.h"

@interface BOHJoinServiceCellTextField ()

@property (nonatomic, assign) UIEdgeInsets textInset;

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

@implementation BOHJoinServiceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.textField];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textField.bounds = self.contentView.bounds;
}

#pragma mark - Properties

- (BOHJoinServiceCellTextField *)textField {
    if (!_textField) {
        _textField = [[BOHJoinServiceCellTextField alloc] initWithFrame:self.contentView.bounds];
        [_textField setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)];
    }
    return _textField;
}

@end
