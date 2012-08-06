//
//  InicialViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InicialViewController.h"
#import "MyDocumentHandler.h"
#import "Theme+Create.h"
#import "ThemeViewController.h"
#import "Seed.h"
#import "Maze+Manage.h"
#import "DifficultyViewController.h"
#import "SoundManager.h"

#define fontSize 15
#define fontName @"Helvetica-Bold"
#define new_game_image @"wine.png"
#define new_game_lable @"NEW GAME"
#define resume_game_image @"red.png"
#define resume_game_lable @"RESUME GAME"
#define settings_game_image @"orange.png"
#define settings_game_lable @"SETTINGS"
#define highscores_game_image @"palegreen.png"
#define highscores_game_lable @"HIGHSCORES"
#define logo_small @"LOGO"



@interface InicialViewController ()

@end

@implementation InicialViewController

@synthesize  document = _document;

-(void)populateInicialData
{
    [Seed populateDatabase:self.document.managedObjectContext];
}

-(NSArray *)getThemes
{
    return [Theme getAllThemes:self.document.managedObjectContext];
}

-(NSArray *)getMazes
{
    return [Maze getAllMazes:self.document.managedObjectContext];
}

-(void)useDocument
{
    NSArray *themes = [self getThemes];
    NSArray *mazes = [self getMazes];
    if ([themes count] == 0 || [mazes count] == 0) {
        [self populateInicialData];
        [self.document saveToURL:self.document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)playInterfaceSound
{
    [[SoundManager sharedSoundManager] playInterface];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[SoundManager sharedSoundManager] playIntro];
    int offset = 25;
    int halfViewSize = [self view].frame.size.width / 2;
    
    UIImage *image = [UIImage imageNamed:new_game_image];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - offset - image.size.width, 180, image.size.width, image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle: new_game_lable forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];//[button.titleLabel.font fontWithSize:fontSize];
    button.titleLabel.textColor = [UIColor whiteColor];

    [button addTarget:self action:@selector(newGameButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1111;
    
    [self.view addSubview:button];
    
    UIImage *image2 = [UIImage imageNamed:resume_game_image];

    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize + offset, 180, image2.size.width, image2.size.height)];
    [button2 setBackgroundImage:image2 forState:UIControlStateNormal];
    [button2 setTitle:resume_game_lable forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];//[button2.titleLabel.font fontWithSize:fontSize];
    button2.titleLabel.textColor = [UIColor whiteColor];
    [button2 addTarget:self action:@selector(newGameButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 1111;
    [self.view addSubview:button2];
    
    UIImage *image3 = [UIImage imageNamed:settings_game_image];

    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - offset - image3.size.width, 230, image3.size.width, image3.size.height)];
    [button3 setBackgroundImage:image3 forState:UIControlStateNormal];
    [button3 setTitle:settings_game_lable forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];//[button3.titleLabel.font fontWithSize:fontSize];
    button3.titleLabel.textColor = [UIColor whiteColor];
    [button3 addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 1111;
    [self.view addSubview:button3];
    
    UIImage *image4 = [UIImage imageNamed:highscores_game_image];

    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize + offset, 230, image4.size.width, image4.size.height)];
    [button4 setBackgroundImage:image4 forState:UIControlStateNormal];
    [button4 setTitle:highscores_game_lable forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];//[button4.titleLabel.font fontWithSize:fontSize];
    button4.titleLabel.textColor = [UIColor whiteColor];
    [button4 addTarget:self action:@selector(newGameButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 1111;
    [self.view addSubview:button4];
}


-(void)settingsButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [self performSegueWithIdentifier:@"settings" sender:self];
}

-(void)newGameButtonTapped:(UIButton *)sender
{
    [self playInterfaceSound];
    [self performSegueWithIdentifier:@"go to dificulty" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[MyDocumentHandler sharedDocumentHandler] performWithDocument:^(UIManagedDocument *document){
        _document = document;
        [self useDocument];
    }];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"go to dificulty"]){
        DifficultyViewController *DVC = (DifficultyViewController*)segue.destinationViewController;
        [DVC setDocument:self.document];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
