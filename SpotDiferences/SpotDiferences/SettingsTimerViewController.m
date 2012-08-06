//
//  SettingsTimerViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsTimerViewController.h"

#define back_button_image @"back.png"
#define fontSize 15
#define fontName @"Helvetica-Bold"

@interface SettingsTimerViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *autoExtendsTime;
@end

@implementation SettingsTimerViewController

@synthesize autoExtendsTime = _autoExtendsTime;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    int offset = 25;
    int halfViewSize = [self view].frame.size.width / 2;
    
    UIImage *bimage = [UIImage imageNamed:back_button_image];

    UIButton *bbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, bimage.size.width, bimage.size.height)];
    [bbutton setBackgroundImage:bimage forState:UIControlStateNormal];
    [bbutton setTitle:@"" forState:UIControlStateNormal];
    [bbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bbutton.titleLabel.font = [bbutton.titleLabel.font fontWithSize:50];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    bbutton.tag = 1111;
    [self.view addSubview:bbutton];
    
    
    UIImage *image = [UIImage imageNamed:@"red"];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - offset - image.size.width, 150, image.size.width, image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle: @"SET TIMER" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];//[button.titleLabel.font fontWithSize:fontSize];
    button.titleLabel.textColor = [UIColor whiteColor];
    
    [button addTarget:self action:@selector(accountsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1111;
    button.enabled = NO;
    [self.view addSubview:button];

    [self.autoExtendsTime addTarget:self action:@selector(autoExtendsTimeChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)autoExtendsTimeChanged:(UIButton*)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    NSString * autoExtendsTime;
    if (self.autoExtendsTime.on) {
        autoExtendsTime = @"YES";
    }else {
        autoExtendsTime = @"NO";
    }
    [prefs setObject:autoExtendsTime forKey:@"autoExtendsTime"];
    [prefs synchronize];
}


-(void)backButtonTapped:(UIButton*)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *autoExtendsTime = [prefs stringForKey:@"autoExtendsTime"];
    if ([autoExtendsTime isEqualToString:@"YES"]) {
        self.autoExtendsTime.on = YES;
    }else {
        self.autoExtendsTime.on = NO;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
