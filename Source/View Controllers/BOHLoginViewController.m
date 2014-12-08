//
//  BLVLoginViewController.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHLoginViewController.h"
#import "BOHJoinServiceCell.h"

@interface BOHLoginViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    UITextFieldDelegate,
    UIGestureRecognizerDelegate,
    UIAlertViewDelegate
>

@property (nonatomic, assign) BOHJoinServiceProvider provider;
@property (nonatomic, strong) BOHJoinServiceOptions  *options;

@property (nonatomic, strong) UIButton               *facebookButton;
@property (nonatomic, strong) UIButton               *twitterButton;

@property (nonatomic, strong) BOHJoinServiceCell     *facebookCell;
@property (nonatomic, strong) BOHJoinServiceCell     *twitterCell;

@property (nonatomic, strong) UITableView            *tableView;

@property (nonatomic, strong) BOHJoinServiceCell     *emailCell;
@property (nonatomic, strong) BOHJoinServiceCell     *passwordCell;
@property (nonatomic, strong) BOHJoinServiceCell     *loginButtonCell;
@property (nonatomic, strong) UIButton               *emailButton;

@property (nonatomic, strong) UIView                 *emailSectionHeaderView;
@property (nonatomic, strong) UILabel                *emailSectionHeaderLabel;

@property (nonatomic, strong) UILabel                *forgotPasswordLabel;

@property (nonatomic, strong) NSArray                *tableViewSections;

@end

@implementation BOHLoginViewController

- (instancetype)initWithProvider:(BOHJoinServiceProvider)provider options:(BOHJoinServiceOptions *)options {
    self = [super init];
    if (self) {
        _provider = provider;
        _options = options;
        self.title = _options.logInScreenOptions.title;
        [self setupTableViewSectionsForProviders:_provider];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = self.options.logInScreenOptions.tableViewBackgroundColor;
    self.view.backgroundColor = self.options.logInScreenOptions.backgroundColor;
    [self.view addSubview:self.tableView];
}

#pragma mark - Setup

- (void)setupTableViewSectionsForProviders:(BOHJoinServiceProvider)provider {
    NSMutableArray *sections = [NSMutableArray arrayWithCapacity:0];
    
    if (provider & BOHJoinServiceProviderFacebook) {
        [sections addObject:[self rowTypesForProvider:BOHJoinServiceProviderFacebook]];
    }
    if (provider & BOHJoinServiceProviderTwitter) {
        [sections addObject:[self rowTypesForProvider:BOHJoinServiceProviderTwitter]];
    }
    if (provider & BOHJoinServiceProviderEmail) {
       [sections addObject:[self rowTypesForProvider:BOHJoinServiceProviderEmail]];
    }
    
    self.tableViewSections = sections;
}

- (NSArray *)rowTypesForProvider:(BOHJoinServiceProvider)provider {
    NSArray *rowTypes = nil;
    
    if (provider & BOHJoinServiceProviderFacebook) {
        rowTypes = @[@(BOHJoinServiceRowTypeFacebookButton)];
    }
    else if (provider & BOHJoinServiceProviderTwitter) {
        rowTypes = @[@(BOHJoinServiceRowTypeTwitterButton)];
    }
    else if (provider & BOHJoinServiceProviderEmail) {
        rowTypes = @[@(BOHJoinServiceRowTypeEmail),
                     @(BOHJoinServiceRowTypePassword),
                     @(BOHJoinServiceRowTypeEmailLoginButton)];
    }
    
    return rowTypes;
}

#pragma mark - Properties

- (BOHJoinServiceCell *)facebookCell {
    if (!_facebookCell) {
        _facebookCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeButton];
        _facebookCell.button = [[BOHJoinServiceButton alloc] initWithType:BOHJoinServiceButtonTypeFacebook];
        [_facebookCell.button addTarget:self action:@selector(facebookAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _facebookCell;
}

- (BOHJoinServiceCell *)twitterCell {
    if (!_twitterCell) {
        _twitterCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeButton];
        _twitterCell.button = [[BOHJoinServiceButton alloc] initWithType:BOHJoinServiceButtonTypeTwitter];
        [_twitterCell.button addTarget:self action:@selector(twitterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _twitterCell;
}

- (BOHJoinServiceCell *)emailCell {
    if (!_emailCell) {
        _emailCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeTextField];
        [_emailCell.textField setPlaceholder:self.options.logInScreenOptions.emailPlaceholderText];
        [_emailCell.textField setReturnKeyType:UIReturnKeyNext];
        [_emailCell.textField setKeyboardType:UIKeyboardTypeEmailAddress];
        [_emailCell.textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_emailCell.textField setDelegate:self];
        [_emailCell.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_emailCell.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    }
    return _emailCell;
}

- (BOHJoinServiceCell *)passwordCell {
    if (!_passwordCell) {
        _passwordCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeTextField];
        [_passwordCell.textField setPlaceholder:self.options.logInScreenOptions.passwordPlaceholderText];
        [_passwordCell.textField setReturnKeyType:UIReturnKeyDone];
        [_passwordCell.textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_passwordCell.textField setSecureTextEntry:YES];
        [_passwordCell.textField setDelegate:self];
        [_passwordCell.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_passwordCell.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    }
    return _passwordCell;
}

- (BOHJoinServiceCell *)loginButtonCell {
    if (!_loginButtonCell) {
        _loginButtonCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeButton];
        _loginButtonCell.button = [[BOHJoinServiceButton alloc] initWithType:BOHJoinServiceButtonTypeDefault];
        [_loginButtonCell.button addTarget:self action:@selector(emailAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButtonCell;
}

- (UILabel *)emailSectionHeaderLabel {
    if (!_emailSectionHeaderLabel) {
        _emailSectionHeaderLabel = [[UILabel alloc]init];
        _emailSectionHeaderLabel.textAlignment = NSTextAlignmentCenter;
        _emailSectionHeaderLabel.text = NSLocalizedString(@"Or", @"Or label in login view");
        _emailSectionHeaderLabel.font = [UIFont fontWithName:@"Avenir-Light" size:16.f];
        UIColor *grayColor = [UIColor colorWithRed:171.f/255.f green:170.f/255.f blue:171.f/255.f alpha:1];
        _emailSectionHeaderLabel.textColor = grayColor;
        _emailSectionHeaderLabel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
        [_emailSectionHeaderLabel sizeToFit];
    }
    return _emailSectionHeaderLabel;
}

- (UIView *)emailSectionHeaderView {
    if (!_emailSectionHeaderView) {
        _emailSectionHeaderView = [[UIView alloc] initWithFrame:(CGRect){0.0f, 0.0f, self.tableView.bounds.size.width, 40.0f}];
        _emailSectionHeaderView.backgroundColor = self.options.logInScreenOptions.backgroundColor;
        _emailSectionHeaderView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _emailSectionHeaderView.clipsToBounds = YES;
        
        CGPoint emailSectionHeaderLabelCenter = self.emailSectionHeaderLabel.center;
        emailSectionHeaderLabelCenter.x = _emailSectionHeaderView.center.x;
        emailSectionHeaderLabelCenter.y = _emailSectionHeaderView.bounds.size.height / 2.0f;
        self.emailSectionHeaderLabel.center = emailSectionHeaderLabelCenter;
        [_emailSectionHeaderView addSubview:self.emailSectionHeaderLabel];
        
        UIColor *grayColor = [UIColor colorWithRed:171.f/255.f green:170.f/255.f blue:171.f/255.f alpha:1];
        
        
        CGFloat rightDividerXOrigin;
        CGFloat dashWidth;
        
        UIView *leftDivider = [[UIView alloc]initWithFrame:(CGRect){16.0f, 20.0f, dashWidth - 32.0f, 0.5f}];
        leftDivider.backgroundColor = grayColor;
        [_emailSectionHeaderView addSubview:leftDivider];
        
        UIView *rightDivider = [[UIView alloc]initWithFrame:(CGRect){rightDividerXOrigin, 20.0f, dashWidth - 32.0f, 0.5f}];
        rightDivider.backgroundColor = grayColor;
        [_emailSectionHeaderView addSubview:rightDivider];
    }
    return _emailSectionHeaderView;
}

- (UILabel *)forgotPasswordLabel {
    if (!_forgotPasswordLabel) {
        _forgotPasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(0., 0.f, self.tableView.bounds.size.width, 80.f)];
        _forgotPasswordLabel.textAlignment = NSTextAlignmentCenter;
        NSString *forgotPasswordString = self.options.logInScreenOptions.forgotPasswordButtonTitle;
        _forgotPasswordLabel.font = [UIFont fontWithName:@"Avenir-Light" size:16.f];
        _forgotPasswordLabel.text = forgotPasswordString;
        UIColor *grayColor = [UIColor colorWithRed:171.f/255.f green:170.f/255.f blue:171.f/255.f alpha:1];
        _forgotPasswordLabel.textColor = grayColor;
        [_forgotPasswordLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(forgotPasswordAction:)]];
        _forgotPasswordLabel.userInteractionEnabled = YES;
        _forgotPasswordLabel.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
        CGPoint center = _forgotPasswordLabel.center;
        center.x = self.tableView.center.x;
        _forgotPasswordLabel.center = center;
    }
    return _forgotPasswordLabel;
}

#pragma mark - Button Actions 

- (void)facebookAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        [self.delegate loginViewController:self didPerformAction:BOHJoinServiceActionLoginWithFacebook parameters:nil];
    }
}

- (void)twitterAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        [self.delegate loginViewController:self didPerformAction:BOHJoinServiceActionLoginWithTwitter parameters:nil];
    }
}

- (void)emailAction:(id)sender {
    
    if ([self emailFieldsPassedValidation]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
            NSDictionary *parameters = @{BLVLoginSignUpParameterEmail : self.emailCell.textField.text,
                                         BLVLoginSignUpParameterPassword : self.passwordCell.textField.text};
            [self.delegate loginViewController:self didPerformAction:BOHJoinServiceActionLoginWithEmail parameters:parameters];
        }
    } else {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"All fields are mandatory", nil)
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil] show];
    }
    
}

- (void)forgotPasswordAction:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:self.options.logInScreenOptions.forgotPasswordAlertTitle
                                                     message:self.options.logInScreenOptions.forgotPasswordAlertMessage
                                                    delegate:self
                                           cancelButtonTitle:self.options.logInScreenOptions.forgotPasswordAlertCancelButtonTitle
                                           otherButtonTitles:self.options.logInScreenOptions.forgotPasswordAlertSendButtonTitle,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField* tf = [alert textFieldAtIndex:0];
    tf.keyboardType = UIKeyboardTypeEmailAddress;
    [alert show];
}

#pragma mark - Field validation

- (BOOL)emailFieldsPassedValidation {
    return (self.emailCell.textField.text.length > 0 && self.passwordCell.textField.text.length > 0);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableViewSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = [self.tableViewSections objectAtIndex:section];
    return items.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.forgotPasswordLabel;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *item = self.tableViewSections[indexPath.section][indexPath.row];
    
    BOHJoinServiceRowType rowType = [item integerValue];
    
    switch (rowType) {
        case BOHJoinServiceRowTypeFacebookButton:{
            return self.facebookCell;
        }break;
        case BOHJoinServiceRowTypeTwitterButton:{
            return self.twitterCell;
        }
        case BOHJoinServiceRowTypeEmail:{
            return self.emailCell;
        }
        case BOHJoinServiceRowTypePassword:{
            return self.passwordCell;
        }
        case BOHJoinServiceRowTypeEmailLoginButton:{
            return self.loginButtonCell;
        }
        default:
            break;
    }
    
    return nil;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.emailCell.textField) {
        [self.passwordCell.textField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
        [self emailAction:nil]; // Log In
    }
    return YES;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == alertView.cancelButtonIndex) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
            [self.delegate loginViewController:self didPerformAction:BOHJoinServiceActionCanceledForgotPasswordAlert parameters:nil];
        }
        
    } else {
        
        NSString *email = [[alertView textFieldAtIndex:0] text];
        
        if (email.length > 0) {
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
                NSDictionary *parameters = @{BLVLoginSignUpParameterEmail : email};
                [self.delegate loginViewController:self didPerformAction:BOHJoinServiceActionRequestedNewPassword parameters:parameters];
            }
            
        }else {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"All fields are mandatory", nil)
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                              otherButtonTitles:nil] show];
        }
    }
}

@end
