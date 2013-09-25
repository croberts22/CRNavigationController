//
//  PrimaryViewController.m
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import "PrimaryViewController.h"
#import "CRNavigationController.h"

@interface PrimaryViewController ()
@property (nonatomic, weak) IBOutlet UIButton *redButton;
@property (nonatomic, weak) IBOutlet UIButton *blueButton;
@property (nonatomic, weak) IBOutlet UIButton *greenButton;
@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *alphaSlider;

- (IBAction)redButtonPressed:(id)sender;
- (IBAction)blueButtonPressed:(id)sender;
- (IBAction)greenButtonPressed:(id)sender;
- (IBAction)slidersToggled:(id)sender;

@end

@implementation PrimaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}

- (IBAction)redButtonPressed:(id)sender {
    self.redSlider.value = 1.0f;
    self.greenSlider.value = 0.0f;
    self.blueSlider.value = 0.0f;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)greenButtonPressed:(id)sender {
    self.redSlider.value = 0.0f;
    self.greenSlider.value = 1.0f;
    self.blueSlider.value = 0.0f;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)blueButtonPressed:(id)sender {
    self.redSlider.value = 0.0f;
    self.greenSlider.value = 0.0f;
    self.blueSlider.value = 1.0f;
    self.alphaSlider.value = 1.0f;
    
    [self slidersToggled:nil];
}

- (IBAction)slidersToggled:(id)sender {
    [self setTintColorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
}

- (void)setTintColorWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha {
    UIColor *tintColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    self.navigationController.navigationBar.barTintColor = tintColor;
}

@end
