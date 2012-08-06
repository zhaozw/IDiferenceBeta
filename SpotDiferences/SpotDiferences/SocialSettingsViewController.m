//
//  SocialSettingsViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SocialSettingsViewController.h"
#define back_button_image @"back.png"

@interface SocialSettingsViewController ()
@property (nonatomic,weak) IBOutlet UISwitch* facebookAutoPost;
@end

@implementation SocialSettingsViewController
@synthesize facebookAutoPost = _facebookAutoPost;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImage *bimage = [UIImage imageNamed:back_button_image];
    NSLog(@"scale is %f",bimage.scale);
    UIButton *bbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, bimage.size.width, bimage.size.height)];
    [bbutton setBackgroundImage:bimage forState:UIControlStateNormal];
    [bbutton setTitle:@"" forState:UIControlStateNormal];
    [bbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bbutton.titleLabel.font = [bbutton.titleLabel.font fontWithSize:50];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    bbutton.tag = 1111;
    [self.view addSubview:bbutton];
    
    [self.facebookAutoPost addTarget:self action:@selector(facebookAutoPostChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *facebookAutoPost = [prefs stringForKey:@"facebookAutoPost"];
    if ([facebookAutoPost isEqualToString:@"YES"]) {
        self.facebookAutoPost.on = YES;
    }else {
        self.facebookAutoPost.on = NO;
    }

}

-(void)backButtonTapped:(UIButton*)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
}

-(void)facebookAutoPostChanged:(UISwitch*)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString * facebookAutoPost;
    if (self.facebookAutoPost.on) {
        facebookAutoPost = @"YES";
    }else {
        facebookAutoPost = @"NO";
    }
    [prefs setObject:facebookAutoPost forKey:@"facebookAutoPost"];
    [prefs synchronize];

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
