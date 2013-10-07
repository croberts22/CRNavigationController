//
//  CRTabBar.m
//
//  Created by Timothy Costa on 10/7/13.
//


#import "CRTabBar.h"
#import "CRNavigationBar.h"

@interface CRTabBar ()
@property (nonatomic, strong) CALayer *colorLayer;
@end
@implementation CRTabBar

static CGFloat const kDefaultColorLayerOpacity = 0.5f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;

- (void)setBarTintColor:(UIColor *)barTintColor {
    [super setBarTintColor:barTintColor];
    
    if (self.colorLayer == nil) {
        self.colorLayer = [CALayer layer];
        self.colorLayer.opacity = kDefaultColorLayerOpacity;
        [self.layer addSublayer:self.colorLayer];
    }
    
    self.colorLayer.backgroundColor = barTintColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.colorLayer != nil) {
        self.colorLayer.frame = self.bounds;        
        [self.layer insertSublayer:self.colorLayer atIndex:1];
    }
}


- (void)displayColorLayer:(BOOL)display {
    self.colorLayer.hidden = !display;
}

@end
