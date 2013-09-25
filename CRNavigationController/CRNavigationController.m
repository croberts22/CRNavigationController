//
//  CRNavigationController.m
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import "CRNavigationController.h"
#import "CRNavigationBar.h"

@interface CRNavigationController ()

@end

@implementation CRNavigationController

- (id)init {
    self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    if(self) {
        // Custom initialization here, if needed.
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    if(self) {
        self.viewControllers = @[rootViewController];
    }
    
    return self;
}

@end
