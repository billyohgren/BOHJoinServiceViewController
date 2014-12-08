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
    UIGestureRecognizerDelegate
>

@property (nonatomic, assign) BLVLoginSignupProvider provider;
@property (nonatomic, strong) BOHJoinServiceOptions  *options;

@property (nonatomic, strong) UIButton               *facebookButton;
@property (nonatomic, strong) UIButton               *twitterButton;

@property (nonatomic, strong) UIButton               *emailButton;

@property (nonatomic, strong) UITableView            *tableView;

@property (nonatomic, strong) BOHJoinServiceCell     *emailCell;
@property (nonatomic, strong) BOHJoinServiceCell     *passwordCell;

@end

@implementation BOHLoginViewController

- (instancetype)initWithProvider:(BLVLoginSignupProvider)provider options:(BOHJoinServiceOptions *)options {
    self = [super init];
    if (self) {
        _provider = provider;
        _options = options;
        self.title = _options.logInScreenOptions.title;
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

#pragma mark - Properties

- (BOHJoinServiceCell *)emailCell {
    if (!_emailCell) {
        _emailCell = [[BOHJoinServiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [_emailCell.textField setPlaceholder:self.options.logInScreenOptions.emailPlaceholderText];
        [_emailCell.textField setReturnKeyType:UIReturnKeyNext];
        [_emailCell.textField setKeyboardType:UIKeyboardTypeEmailAddress];
        [_emailCell.textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_emailCell.textField setDelegate:self];
        [_emailCell.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_emailCell.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
        //[_emailCell setSeparatorLine:YES];
    }
    return _emailCell;
}

- (BOHJoinServiceCell *)passwordCell {
    if (!_passwordCell) {
        _passwordCell = [[BOHJoinServiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
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

#pragma mark - Button Actions 

- (void)facebookAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        [self.delegate loginViewController:self didPerformAction:BLVLoginSignupActionLoginWithFacebook parameters:nil];
    }
}

- (void)twitterAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        [self.delegate loginViewController:self didPerformAction:BLVLoginSignupActionLoginWithTwitter parameters:nil];
    }
}

- (void)emailAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginViewController:didPerformAction:parameters:)]) {
        NSDictionary *parameters = @{BLVLoginSignUpParameterEmail : self.emailCell.textField.text,
                                     BLVLoginSignUpParameterPassword : self.passwordCell.textField.text};
        [self.delegate loginViewController:self didPerformAction:BLVLoginSignupActionLoginWithEmail parameters:parameters];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return self.emailCell;
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
