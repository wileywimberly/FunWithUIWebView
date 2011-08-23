//
//  FunWithUIWebViewAppDelegate.h
//  FunWithUIWebView
//
//  Created by Wiley Wimberly on 8/23/11.
//  Copyright 2011 Warm Fuzzy Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FunWithUIWebViewViewController;

@interface FunWithUIWebViewAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FunWithUIWebViewViewController *viewController;

@end
