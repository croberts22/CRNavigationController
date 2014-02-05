//
//  CRNavigationBar.h
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <UIKit/UIKit.h>

/**
 * For use for devices running iOS 7.0.3 and later, up to iOS 7.1. This overrides the alpha value of any color
 * passed in to be 70%. Since (starting with this version) the blur effect is ultimately
 * determined by the transparency of the color, setting this to a value other than 1.0f will
 * provide said blurriness. Values between 0.5f and 0.7f seem to work best while still trying
 * to retain most of the desired color. 
 * @warning: Setting this value to 1.0f will reduce blurred translucency significantly.
 */
static CGFloat const kDefaultNavigationBarAlpha = 0.70f;

@interface CRNavigationBar : UINavigationBar

/**
 * If set to YES, this will override the opacity of the barTintColor and will set it to
 * the value contained in kDefaultNavigationBarAlpha.
 */
@property (nonatomic, assign) BOOL overrideOpacity;

/**
 * Determines whether or not the extra color layer should be displayed.
 * @param display a BOOL; YES for keeping it visible, NO to hide it.
 * @warning this method is not available in the actual implementation, and is only here for demonstration purposes.
 */
- (void)displayColorLayer:(BOOL)display;

@end
