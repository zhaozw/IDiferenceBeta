//
//  DifficultyViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DifficultyViewController.h"
#import "ThemeViewController.h"
#import "Theme+Create.h"
#import "Maze+Manage.h"
#import "SoundManager.h"

#define fontSize 15
#define fontName @"Helvetica-Bold"
#define back_button_image @"back.png"
#define beginner_button_image @"orange.png"
#define BEGINNER_button_label @"BEGINNER"
#define INTERMEDIATE_button_image @"darkerorange.png"
#define INTERMEDIATE_button_lable @"INTERMEDIATE"
#define EXPERT_button_image @"red.png"
#define EXPERT_button_lable @"EXPERT"
#define DETECTIVE_button_image @"darkerred.png"
#define DETECTIVE_button_lable @"DETECTIVE"
#define choose_dificulty @"txtdificulty.png"


@interface DifficultyViewController ()

@end

@implementation DifficultyViewController
@synthesize  document = _document;

-(NSArray *)getThemes
{
    return [Theme getAllThemes:self.document.managedObjectContext];
}

-(NSArray *)getMazes
{
    return [Maze getAllMazes:self.document.managedObjectContext];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ThemeViewController *tvc = (ThemeViewController*)segue.destinationViewController;
    tvc.themes = [self getThemes];
}

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
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    int halfViewSize = [self view].frame.size.width / 2;
    int inicial_position = 100;
    int offset = 50;

    UIImage *chooselableimage = [UIImage imageNamed:choose_dificulty]; 
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(halfViewSize - chooselableimage.size.width/2, 50, chooselableimage.size.width, chooselableimage.size.height)];
    imageview.image = chooselableimage;
    [self.view addSubview:imageview];
    
    UIImage *bimage = [UIImage imageNamed:back_button_image];

    UIButton *bbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, bimage.size.width, bimage.size.height)];
    [bbutton setBackgroundImage:bimage forState:UIControlStateNormal];
    [bbutton setTitle:@"" forState:UIControlStateNormal];
    [bbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bbutton.titleLabel.font = [bbutton.titleLabel.font fontWithSize:50];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    bbutton.tag = 1111;
    [self.view addSubview:bbutton];
    
    UIImage *image = [UIImage imageNamed:beginner_button_image];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image.size.width/2, inicial_position, image.size.width, image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:BEGINNER_button_label forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(beginnerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1111;
    [self.view addSubview:button];
    
    UIImage *image2 = [UIImage imageNamed:INTERMEDIATE_button_image];

    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image2.size.width/2, inicial_position+offset, image2.size.width, image2.size.height)];
    [button2 setBackgroundImage:image2 forState:UIControlStateNormal];
    [button2 setTitle:INTERMEDIATE_button_lable forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button2 addTarget:self action:@selector(intermediateButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 1111;
    [self.view addSubview:button2];
    
    UIImage *image3 = [UIImage imageNamed:EXPERT_button_image];

    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image3.size.width/2, inicial_position+offset*2, image3.size.width, image3.size.height)];
    [button3 setBackgroundImage:image3 forState:UIControlStateNormal];
    [button3 setTitle:EXPERT_button_lable forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button3 addTarget:self action:@selector(expertButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 1111;
    [self.view addSubview:button3];
    
    UIImage *image4 = [UIImage imageNamed:DETECTIVE_button_image];

    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image4.size.width/2, inicial_position+offset*3, image4.size.width, image4.size.height)];
    [button4 setBackgroundImage:image4 forState:UIControlStateNormal];
    [button4 setTitle:DETECTIVE_button_lable forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button4 addTarget:self action:@selector(detectiveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 1111;
    [self.view addSubview:button4];
}

-(void)playInterfaceSound
{
    [[SoundManager sharedSoundManager] playInterface];
}

-(void)beginnerButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [self dificultyChosed:@"beginner"];
}

-(void)intermediateButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [self dificultyChosed:@"intermediate"];
}

-(void)expertButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [self dificultyChosed:@"expert"];
}

-(void)detectiveButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [self dificultyChosed:@"detective"];
}

-(void)dificultyChosed:(NSString*)difficulty
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:difficulty forKey:@"difficulty"];
    [prefs synchronize];
    [self performSegueWithIdentifier:@"choose theme" sender:self];
}

-(void)backButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [[self navigationController]popViewControllerAnimated:YES];
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
