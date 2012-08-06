//
//  ImageDetailViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageDetailViewController.h"
#import "Maze+Manage.h"
#import "Theme.h"
#import "GameViewController.h"
#import "SoundManager.h"

#define image_holder @"levelimageholder_old"
#define fontSize 15
#define fontName @"Helvetica-Bold"
#define best_time_button_image @"orange.png"
#define best_time_button_label @"BEST TIME"
#define expected_time_button_image @"darkerorange.png"
#define expected_time_button_lable @"EXPECTED TIME"
#define score_button_image @"red.png"
#define score_button_lable @"SCORE"
#define highest_score_button_image @"darkerred.png"
#define highest_score_button_lable @"HIGHEST SCORE"


@interface ImageDetailViewController ()
@property (nonatomic,weak) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *besttime;
@property (weak, nonatomic) IBOutlet UILabel *expectedtime;
@property (weak, nonatomic) IBOutlet UILabel *personalscore;
@property (weak, nonatomic) IBOutlet UILabel *highestscore;
@property (weak, nonatomic) IBOutlet UILabel *mazeDetail;

@end

@implementation ImageDetailViewController

@synthesize document = _document;
@synthesize foto = _foto;
@synthesize imageview = _imageview;
@synthesize besttime = _besttime;
@synthesize expectedtime = _expectedtime;
@synthesize personalscore = _personalscore;
@synthesize highestscore = _highestscore;
@synthesize mazeDetail = _mazeDetail;
@synthesize maze = _maze;

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
    
    _maze = [Maze getMazeByName:self.foto inManagedObjectContext:self.document.managedObjectContext];
    self.mazeDetail.font = [UIFont fontWithName:fontName size: fontSize];
    NSString *themeName = [_maze.theme.name uppercaseString]; 
    NSMutableString *lvlName = [[_maze.name uppercaseString] mutableCopy];
    self.mazeDetail.text = [NSString stringWithFormat:@"%@ THEME - LEVEL %@",themeName ,lvlName];
}

- (void)viewDidUnload
{
    [self setBesttime:nil];
    [self setExpectedtime:nil];
    [self setPersonalscore:nil];
    [self setHighestscore:nil];
    [self setMazeDetail:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[SoundManager sharedSoundManager] playIntro];
    int halfViewSize = [self view].frame.size.width / 2;
    
    UIImage *bimage = [UIImage imageNamed:@"back.png"];
    UIButton *bbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, bimage.size.width, bimage.size.height)];
    [bbutton setBackgroundImage:bimage forState:UIControlStateNormal];
    [bbutton setTitle:@"" forState:UIControlStateNormal];
    [bbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bbutton.titleLabel.font = [bbutton.titleLabel.font fontWithSize:50];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    bbutton.tag = 1111;
    [self.view addSubview:bbutton];
    
    UIImage *image;
    image = [UIImage imageNamed: self.foto];
    
    UIImage *normalImage = [UIImage imageNamed: image_holder];
    UIImage *normalImage2 = image;
    
    UIGraphicsBeginImageContext( CGSizeMake(normalImage.size.width, normalImage.size.height) );
    [normalImage drawInRect:CGRectMake(0,0,normalImage.size.width,normalImage.size.height)];
    [normalImage2 drawInRect:CGRectMake(20,20,normalImage.size.width - 40,normalImage.size.height -40)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, newImage.size.width, newImage.size.height)];
    imageview.image = newImage;
    self.imageview = imageview;
    [self.view addSubview:imageview];
    
    UIImage *playimage = [UIImage imageNamed:@"wine.png"];

    UIButton *playbutton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - playimage.size.width/2, 270, playimage.size.width, playimage.size.height)];
    [playbutton setBackgroundImage:playimage forState:UIControlStateNormal];
    [playbutton setTitle:@"START!" forState:UIControlStateNormal];
    [playbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    playbutton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    playbutton.titleLabel.textColor = [UIColor whiteColor];
    [playbutton addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    playbutton.tag = 1111;
    [self.view addSubview:playbutton];
    
    UIImage *best_time_image = [UIImage imageNamed:best_time_button_image];

    UIButton *best_time_button = [[UIButton alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + 20, 70, best_time_image.size.width, best_time_image.size.height)];
    [best_time_button setBackgroundImage:best_time_image forState:UIControlStateNormal];
    [best_time_button setTitle:best_time_button_label forState:UIControlStateNormal];
    best_time_button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    best_time_button.titleLabel.textColor = [UIColor whiteColor];
    [best_time_button addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    best_time_button.tag = 1111;
    best_time_button.enabled = NO;
    [self.view addSubview:best_time_button];

    UILabel *best_time_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + best_time_image.size.width + 30, 80, 90, 25)];
    best_time_lable.text = @"00:00";
    best_time_lable.backgroundColor = [UIColor clearColor];
    best_time_lable.font = [UIFont fontWithName:fontName size: fontSize+5];
    best_time_lable.textColor = [UIColor whiteColor];
    best_time_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:best_time_lable];
    
    
    UIImage *expected_time_image = [UIImage imageNamed:expected_time_button_image];

    UIButton *expected_time_button = [[UIButton alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + 20, 120, expected_time_image.size.width, expected_time_image.size.height)];
    [expected_time_button setBackgroundImage:expected_time_image forState:UIControlStateNormal];
    [expected_time_button setTitle:expected_time_button_lable forState:UIControlStateNormal];
    expected_time_button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    expected_time_button.titleLabel.textColor = [UIColor whiteColor];
    [expected_time_button addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    expected_time_button.tag = 1111;
    expected_time_button.enabled = NO;
    [self.view addSubview:expected_time_button];
    
    UILabel *expected_time_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + expected_time_image.size.width + 30, 130, 90, 25)];
    expected_time_lable.text = @"00:00";
    expected_time_lable.backgroundColor = [UIColor clearColor];
    expected_time_lable.font = [UIFont fontWithName:fontName size: fontSize+5];
    expected_time_lable.textColor = [UIColor whiteColor];
    expected_time_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:expected_time_lable];
    
    UIImage *score_image = [UIImage imageNamed:score_button_image];

    UIButton *score_button = [[UIButton alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + 20, 170, score_image.size.width, score_image.size.height)];
    [score_button setBackgroundImage:score_image forState:UIControlStateNormal];
    [score_button setTitle:score_button_lable forState:UIControlStateNormal];
    score_button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    score_button.titleLabel.textColor = [UIColor whiteColor];
    [score_button addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    score_button.tag = 1111;
    score_button.enabled = NO;
    [self.view addSubview:score_button];
    
    UILabel *score_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + score_image.size.width + 30, 180, 90, 25)];
    score_lable.text = @"-----";
    score_lable.backgroundColor = [UIColor clearColor];
    score_lable.font = [UIFont fontWithName:fontName size: fontSize+5];
    score_lable.textColor = [UIColor whiteColor];
    score_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:score_lable];
    
    UIImage *highest_score_image = [UIImage imageNamed:highest_score_button_image];

    UIButton *highest_score_button = [[UIButton alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + 20, 220, highest_score_image.size.width, highest_score_image.size.height)];
    [highest_score_button setBackgroundImage:highest_score_image forState:UIControlStateNormal];
    [highest_score_button setTitle:highest_score_button_lable forState:UIControlStateNormal];
    highest_score_button.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    highest_score_button.titleLabel.textColor = [UIColor whiteColor];
    [highest_score_button addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    highest_score_button.tag = 1111;
    highest_score_button.enabled = NO;
    [self.view addSubview:highest_score_button];
    
    UILabel *highest_score_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.imageview.frame.size.width + highest_score_image.size.width + 30, 230, 90, 25)];
    highest_score_lable.text = @"00000";
    highest_score_lable.backgroundColor = [UIColor clearColor];
    highest_score_lable.font = [UIFont fontWithName:fontName size: fontSize+5];
    highest_score_lable.textColor = [UIColor whiteColor];
    highest_score_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:highest_score_lable];
}

-(void)playInterfaceSound
{
    [[SoundManager sharedSoundManager] playInterface];
}


-(void)startButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [[SoundManager sharedSoundManager] stopIntro];
    [self performSegueWithIdentifier:@"start game" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GameViewController *gvc = (GameViewController*)segue.destinationViewController;
    [gvc setupWith:_maze andContext: [_document managedObjectContext]];
    
}

-(void)backButtonTapped:(UIButton*)sender
{
    self.imageview.hidden = YES;
    [[self navigationController]popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    //return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
