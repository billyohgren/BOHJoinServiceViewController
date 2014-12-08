//
//  AppDelegate.m
//  BOHJoinServiceViewControllerExample
//
//  Created by Billy on 08/12/14.
//  Copyright (c) 2014 Billy Ohgren. All rights reserved.
//

#import "AppDelegate.h"
#import "BOHJoinServiceViewController.h"

@interface AppDelegate ()
<
    BOHJoinServiceViewControllerDelegate
>

@property (nonatomic, strong) BOHJoinServiceViewController *joinVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOHJoinServiceOptions *options = [[BOHJoinServiceOptions alloc] init];
    options.mainScreenOptions.backgroundColor = [UIColor greenColor];
    options.mainScreenOptions.buttonLayout = BLVLoginSignupButtonLayoutVertical;
    
    
    self.joinVC = [[BOHJoinServiceViewController alloc] initWithProvider:BOHJoinServiceProviderEmail |
                                        BOHJoinServiceProviderFacebook
                                                                                      options:options];
    self.joinVC.delegate = self;
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:self.joinVC];
    self.window.rootViewController = navVC;
    
    return YES;
}

- (void)joinServiceViewController:(BOHJoinServiceViewController *)vc performedAction:(BOHJoinServiceAction)action parameters:(NSDictionary *)parameters {
    NSLog(@"Join VC did perform action: %li \nwith parameters %@", action, parameters);
    [self.joinVC showLoader:YES];
}
@end
