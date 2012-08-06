//
//  SplashViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"
#import "MyDocumentHandler.h"
#import "Seed.h"
#import "Theme+Create.h"
#import "Maze+Manage.h"
#import "SoundManager.h"

@interface SplashViewController ()
@property (nonatomic) int time;
@property (nonatomic,weak) NSTimer *timer;

@end

@implementation SplashViewController
@synthesize time = _time;
@synthesize timer = _timer;
@synthesize imageview = _imageview;
@synthesize document  =_document;

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

-(void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 
                                                  target:self 
                                                selector:@selector(timerCall:) 
                                                userInfo:nil 
                                                 repeats:YES];
}

/*
 *
 * end a timer
 *
 */

-(void)stopTimer
{
    [self.timer invalidate];
}

-(void)timerCall:(NSTimer*)sender
{
    if(self.time >= 3)
    {
        [self stopTimer];
        [self performSegueWithIdentifier:@"show inicial view" sender:self];
    }
    self.time++;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageview.image = [UIImage imageNamed:@"Diferences_tela"]; 
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startTimer];    
    self.time = 0;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self stopTimer];
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[MyDocumentHandler sharedDocumentHandler] performWithDocument:^(UIManagedDocument *document){
        _document = document;
        [self useDocument];
    }];
    [[SoundManager sharedSoundManager] playIntro];
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
