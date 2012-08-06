//
//  SettingsViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

#define back_button_image @"back.png"
#define fontSize 15
#define fontName @"Helvetica-Bold"
#define settings_accounts_image @"wine.png"
#define settings_accounts_lable @"ACCOUNTS"
#define settings_credits_image @"red.png"
#define settings_credits_lable @"CREDITS"
#define settings_TIMER_image @"orange.png"
#define settings_TIMER_lable @"TIMER"
#define settings_social_image @"palegreen.png"
#define settings_social_lable @"SOCIAL"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    
    
    UIImage *image = [UIImage imageNamed:settings_accounts_image];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - offset - image.size.width, 150, image.size.width, image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle: settings_accounts_lable forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];    button.titleLabel.textColor = [UIColor whiteColor];
    
    [button addTarget:self action:@selector(accountsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1111;
    
    [self.view addSubview:button];
    
    UIImage *image2 = [UIImage imageNamed:settings_credits_image];

    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize + offset, 150, image2.size.width, image2.size.height)];
    [button2 setBackgroundImage:image2 forState:UIControlStateNormal];
    [button2 setTitle:settings_credits_lable forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];    button2.titleLabel.textColor = [UIColor whiteColor];
    [button2 addTarget:self action:@selector(creditsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 1111;
    [self.view addSubview:button2];
    
    UIImage *image3 = [UIImage imageNamed:settings_TIMER_image];

    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - offset - image3.size.width, 200, image3.size.width, image3.size.height)];
    [button3 setBackgroundImage:image3 forState:UIControlStateNormal];
    [button3 setTitle:settings_TIMER_lable forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];    button3.titleLabel.textColor = [UIColor whiteColor];
    [button3 addTarget:self action:@selector(timerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 1111;
    [self.view addSubview:button3];
    
    UIImage *image4 = [UIImage imageNamed:settings_social_image];

    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize + offset, 200, image4.size.width, image4.size.height)];
    [button4 setBackgroundImage:image4 forState:UIControlStateNormal];
    [button4 setTitle:settings_social_lable forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];    button4.titleLabel.textColor = [UIColor whiteColor];
    [button4 addTarget:self action:@selector(socialButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 1111;
    [self.view addSubview:button4];
}

-(void)accountsButtonTapped:(UIButton*)sender
{
    NSLog(@"accounts button tapped");
}

-(void)creditsButtonTapped:(UIButton*)sender
{
    NSLog(@"credits button tapped");
}

-(void)timerButtonTapped:(UIButton*)sender
{
    NSLog(@"timer button tapped");
    [self performSegueWithIdentifier:@"settings timer" sender:self];
}

-(void)socialButtonTapped:(UIButton*)sender
{
    NSLog(@"social button tapped");
    [self performSegueWithIdentifier:@"social" sender:self];
}

-(void)backButtonTapped:(UIButton*)sender
{
    NSLog(@"back button clicked");
    [[self navigationController]popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
