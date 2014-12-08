//
//  BLVSignupViewController.m
//  BLVLoginSignUpViewController
//
//  Created by Billy on 07/12/14.
//  Copyright (c) 2014 Bloglovin. All rights reserved.
//

#import "BOHSignupViewController.h"
#import "BOHJoinServiceCell.h"

@interface BOHSignupViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    UITextFieldDelegate,
    UIGestureRecognizerDelegate
>

@property (nonatomic, strong) UITableView            *tableView;

@property (nonatomic, strong) BOHJoinServiceCell     *facebookCell;
@property (nonatomic, strong) BOHJoinServiceCell     *twitterCell;

@property (nonatomic, strong) BOHJoinServiceCell     *nameCell;
@property (nonatomic, strong) BOHJoinServiceCell     *emailCell;
@property (nonatomic, strong) BOHJoinServiceCell     *passwordCell;
@property (nonatomic, strong) BOHJoinServiceCell     *loginButtonCell;

@property (nonatomic, assign) BOHJoinServiceProvider provider;
@property (nonatomic, strong) BOHJoinServiceOptions  *options;

@property (nonatomic, strong) UIButton               *emailButton;

@property (nonatomic, strong) UIButton               *tosButton;

@property (nonatomic, strong) NSArray                *tableViewSections;

@end

@implementation BOHSignupViewController

- (instancetype)initWithProvider:(BOHJoinServiceProvider)provider options:(BOHJoinServiceOptions *)options {
    self = [super init];
    if (self) {
        _provider = provider;
        _options = options;
        self.title = _options.signUpScreenOptions.title;
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
        rowTypes = @[@(BOHJoinServiceRowTypeName),
                     @(BOHJoinServiceRowTypeEmail),
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

- (BOHJoinServiceCell *)nameCell {
    if (!_nameCell) {
        _nameCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeTextField];
        [_nameCell.textField setPlaceholder:self.options.signUpScreenOptions.namePlaceholderText];
        [_nameCell.textField setReturnKeyType:UIReturnKeyNext];
        [_nameCell.textField setKeyboardType:UIKeyboardTypeEmailAddress];
        [_nameCell.textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_nameCell.textField setDelegate:self];
        [_nameCell.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_nameCell.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    }
    return _nameCell;
}

- (BOHJoinServiceCell *)emailCell {
    if (!_emailCell) {
        _emailCell = [[BOHJoinServiceCell alloc] initWithType:BOHJoinServiceCellTypeTextField];
        [_emailCell.textField setPlaceholder:self.options.signUpScreenOptions.emailPlaceholderText];
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
        [_passwordCell.textField setPlaceholder:self.options.signUpScreenOptions.passwordPlaceholderText];
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

#pragma mark - Button Actions

- (void)facebookAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(signupViewController:didPerformAction:parameters:)]) {
        [self.delegate signupViewController:self didPerformAction:BOHJoinServiceActionSignupWithFacebook parameters:nil];
    }
}

- (void)twitterAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(signupViewController:didPerformAction:parameters:)]) {
        [self.delegate signupViewController:self didPerformAction:BOHJoinServiceActionSignupWithTwitter parameters:nil];
    }
}

- (void)emailAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(signupViewController:didPerformAction:parameters:)]) {
        NSDictionary *parameters = @{BLVLoginSignUpParameterName : self.nameCell.textField.text,
                                     BLVLoginSignUpParameterEmail : self.emailCell.textField.text,
                                     BLVLoginSignUpParameterPassword : self.passwordCell.textField.text};
        [self.delegate signupViewController:self didPerformAction:BOHJoinServiceActionSignupWithEmail parameters:parameters];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableViewSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = [self.tableViewSections objectAtIndex:section];
    return items.count;
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
        case BOHJoinServiceRowTypeName:{
            return self.nameCell;
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

@end
