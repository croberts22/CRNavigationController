//
//  PrimaryViewController.m
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import "PrimaryViewController.h"
#import "TestViewController.h"
#import "CRNavigationBar.h"
#import "CRNavigationController.h"

@interface PrimaryViewController ()
@property (nonatomic, weak) IBOutlet UIButton *redButton;
@property (nonatomic, weak) IBOutlet UIButton *blueButton;
@property (nonatomic, weak) IBOutlet UIButton *greenButton;
@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *alphaSlider;
@property (nonatomic, weak) IBOutlet UILabel *redValue;
@property (nonatomic, weak) IBOutlet UILabel *greenValue;
@property (nonatomic, weak) IBOutlet UILabel *blueValue;
@property (nonatomic, weak) IBOutlet UILabel *alphaValue;
@property (nonatomic, weak) IBOutlet UISegmentedControl *layerControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *colorControl;

- (IBAction)redButtonPressed:(id)sender;
- (IBAction)blueButtonPressed:(id)sender;
- (IBAction)greenButtonPressed:(id)sender;
- (IBAction)slidersToggled:(id)sender;
- (IBAction)layerControllerChanged:(id)sender;
- (IBAction)colorControllerChanged:(id)sender;
- (void)setBarTintColorWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha;
- (void)setBackgroundColorWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha;
- (IBAction)testConfigurationPressed:(id)sender;

@end

@implementation PrimaryViewController

static NSArray *barTintColors = nil;
static NSArray *viewBackgroundColors = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        barTintColors = @[ @(0.5f), @(0.5f), @(0.5f), @(1.0f) ];
        viewBackgroundColors = @[ @(1.0f), @(1.0f), @(1.0f), @(1.0f) ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CRNavigationControllerExample";
    
    self.colorControl.selectedSegmentIndex = 0;
    self.layerControl.selectedSegmentIndex = 1;
    
    self.redSlider.value = 0.5f;
    self.greenSlider.value = 0.5f;
    self.blueSlider.value = 0.5f;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)redButtonPressed:(id)sender {
    self.redSlider.value = 198.0/255.0;
    self.greenSlider.value = 50.0/255.0;
    self.blueSlider.value = 53.0/255.0;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)greenButtonPressed:(id)sender {
    self.redSlider.value = 133.0/255.0;
    self.greenSlider.value = 196.0/255.0;
    self.blueSlider.value = 65.0/255.0;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)blueButtonPressed:(id)sender {
    self.redSlider.value = 66.0/255.0f;
    self.greenSlider.value = 96.0/255.0f;
    self.blueSlider.value = 153.0/255.0f;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)slidersToggled:(id)sender {
    if(self.colorControl.selectedSegmentIndex == 0) {
        [self setBarTintColorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    }
    else {
        [self setBackgroundColorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    }
}

- (IBAction)layerControllerChanged:(id)sender {
    CRNavigationController *navigationController = (CRNavigationController *)self.navigationController;
    CRNavigationBar *navigationBar = (CRNavigationBar *)navigationController.navigationBar;
    
    [navigationBar displayColorLayer:(self.layerControl.selectedSegmentIndex == 1)];
}

- (IBAction)colorControllerChanged:(id)sender {
    if(self.colorControl.selectedSegmentIndex == 0) {
        viewBackgroundColors = @[ @(self.redSlider.value), @(self.greenSlider.value), @(self.blueSlider.value), @(self.alphaSlider.value) ];
        
        self.redSlider.value = [barTintColors[0] doubleValue];
        self.greenSlider.value = [barTintColors[1] doubleValue];
        self.blueSlider.value = [barTintColors[2] doubleValue];
        self.alphaSlider.value = [barTintColors[3] doubleValue];
    }
    else {
        barTintColors = @[ @(self.redSlider.value), @(self.greenSlider.value), @(self.blueSlider.value), @(self.alphaSlider.value) ];
        
        self.redSlider.value = [viewBackgroundColors[0] doubleValue];
        self.greenSlider.value = [viewBackgroundColors[1] doubleValue];
        self.blueSlider.value = [viewBackgroundColors[2] doubleValue];
        self.alphaSlider.value = [viewBackgroundColors[3] doubleValue];
    }
    
    [self slidersToggled:nil];
}

- (void)setBarTintColorWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha {
    UIColor *tintColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    self.navigationController.navigationBar.barTintColor = tintColor;
    
    const CGFloat *components = CGColorGetComponents(tintColor.CGColor);
    
    self.redValue.text = [NSString stringWithFormat:@"%d", (int)((components[0] / 1.0f) * 255)];
    self.greenValue.text = [NSString stringWithFormat:@"%d", (int)((components[1] / 1.0f) * 255)];
    self.blueValue.text = [NSString stringWithFormat:@"%d", (int)((components[2] / 1.0f) * 255)];
    self.alphaValue.text = [NSString stringWithFormat:@"%d%%", (int)((CGColorGetAlpha(tintColor.CGColor) / 1.0f) * 100)];
}

- (void)setBackgroundColorWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha {
    UIColor *backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    self.view.backgroundColor = backgroundColor;
    
    const CGFloat *components = CGColorGetComponents(backgroundColor.CGColor);
    
    self.redValue.text = [NSString stringWithFormat:@"%d", (int)((components[0] / 1.0f) * 255)];
    self.greenValue.text = [NSString stringWithFormat:@"%d", (int)((components[1] / 1.0f) * 255)];
    self.blueValue.text = [NSString stringWithFormat:@"%d", (int)((components[2] / 1.0f) * 255)];
    self.alphaValue.text = [NSString stringWithFormat:@"%d%%", (int)((CGColorGetAlpha(backgroundColor.CGColor) / 1.0f) * 100)];
}

#pragma mark - IBAction Methods

- (IBAction)testConfigurationPressed:(id)sender {
    TestViewController *vc = [[TestViewController alloc] init];
    vc.view.backgroundColor = self.view.backgroundColor;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
