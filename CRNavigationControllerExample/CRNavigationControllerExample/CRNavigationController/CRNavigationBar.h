//
//  CRNavigationBar.h
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRNavigationBar : UINavigationBar

/**
 * Determines whether or not the extra color layer should be displayed.
 * @param display a BOOL; YES for keeping it visible, NO to hide it.
 * @warning this method is not available in the actual implementation, and is only here for demonstration purposes.
 */
- (void)displayColorLayer:(BOOL)display;

@end
