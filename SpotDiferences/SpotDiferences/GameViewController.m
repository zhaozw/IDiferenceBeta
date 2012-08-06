/*
 *  GameViewController.m
 *  SpotDiferences
 *
 *  Copyright 2012 Go4Mobility
 *
 */

#import "GameViewController.h"
#import "ThemeViewController.h"
#import "InicialViewController.h"

#import "MazeView.h"

#import "MyDocumentHandler.h"
#import "ImagesForThemeCarouselViewController.h"
#import "AppDelegate.h"
#import "FBConnect.h"

#import "DifferenceFotos+Manage.h"
#import "Differences.h"

#import <Twitter/Twitter.h>
#import <math.h>

#import "SoundManager.h"
#import "MazeHelper.h"
#import "CGMarkerHelper.h"

#define starOffset 15
#define offset 5
#define fontSize 15
#define fontName @"Helvetica-Bold"
#define intervalTimer 30
#define errorImage @"erro"



/**
 * Esta classe é Controlador principal do jogo
 *
 */

@interface GameViewController () <UIScrollViewDelegate>

// ScrollViews
@property (weak, nonatomic) IBOutlet UIScrollView *rightScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *leftScrollView;

// ImageViews
@property (weak, nonatomic) IBOutlet MazeView *rightImageView;
@property (weak, nonatomic) IBOutlet MazeView *leftImageView;


// Timer and ProgressionView
@property (weak, nonatomic) NSTimer *timer;
@property (nonatomic,weak) IBOutlet UIProgressView *slider;

// Navigation Bar (?)
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;


@property (nonatomic,strong) NSMutableArray *timerUnits;
@property (nonatomic,strong) NSMutableArray *stars;
@property (nonatomic,strong) NSMutableArray *redstars;

@property (nonatomic,weak) UILabel *score;
@property (nonatomic,strong) NSMutableArray *pauseViews;

@property (nonatomic,strong) NSString* fetchFoto;

@property (nonatomic) int clickError;
@property (nonatomic) int clickOk;

@end

@implementation GameViewController

@synthesize rightScrollView = _rightScrollView;
@synthesize leftScrollView = _leftScrollView;
@synthesize rightImageView = _rightImageView;
@synthesize leftImageView = _leftImageView;

//(?)
@synthesize navigationBar = _navigationBar;

@synthesize slider = _slider;
@synthesize timer = _timer;
@synthesize timerUnits = _timerUnits;
@synthesize stars = _stars;
@synthesize score =_score;
@synthesize pauseViews = _pauseViews;
@synthesize redstars = _redstars;

@synthesize fetchFoto = _fetchFoto;
@synthesize clickError = _clickError;
@synthesize clickOk = _clickOk;

@synthesize mazeHelper = _mazeHelper;



#pragma mark - Setup


/**
 * 
 *
 **/
- (void) setupWith:(Maze*)maze andContext:(NSManagedObjectContext *) context {
    
    NSLog(@"maze name is %@", maze.name);
    NSMutableArray *differences = [[[DifferenceFotos getDiffs:[NSString stringWithFormat:@"%@A",maze.name] 
                                       inManagedObjectContext:context] allObjects] mutableCopy];
    
    _mazeHelper = [MazeHelper initWith:maze mazeDifferences:differences];
    NSLog(@"mazeHelper Set!");
}



#pragma mark - Clean


-(void)clearBothScreens {
    [_mazeHelper reset];
    [_rightImageView reset];
    [_leftImageView reset];
}



-(void)restartScore {
    self.score.text = @"000000";
    self.score.tag = 0;
}



-(void)removeAllStars {
    while ([self.stars count]> 0) {
        UIView *view = [self.stars lastObject];
        [view removeFromSuperview];
        [self.stars removeLastObject];
    }
    while ([self.redstars count]> 0) {
        UIView *view = [self.redstars lastObject];
        [view removeFromSuperview];
        [self.redstars removeLastObject];
    }
}



-(void)restartStar {
    [self removeAllStars];
    for (int c = 2; c > -3; c--) {
        UIImage *starimage = [UIImage imageNamed:@"whitestar"];
        UIImageView *starimageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-starimage.size.width/2 + starOffset * c, 10, starimage.size.width, starimage.size.height)];
        starimageview.image = starimage;
        [self.view addSubview:starimageview];
        [self.stars addObject:starimageview];
    }
}



#pragma mark - Getters and Setters



/**
 * Redstars Getter, instantiates the array if not defined
 *
 **/
- (NSMutableArray*) redstars {
    if (!_redstars) {
        _redstars = [[NSMutableArray alloc] init];
    }
    return _redstars;
}



/**
 * PauseViews Getter, instantiates the array if not defined
 *
 **/
- (NSMutableArray*) pauseViews {
    if(!_pauseViews){
        _pauseViews = [[NSMutableArray alloc]init];
    }
    return _pauseViews;
}



/**
 * Stars Getter, instantiates the array if not defined
 *
 **/
- (NSMutableArray*) stars {
    if (!_stars) {
        _stars = [[NSMutableArray alloc] init];
    }
    return _stars;
}



/**
 * TimerUnits Getter, instantiates the array if not defined
 *
 **/
- (NSMutableArray*) timerUnits {
    if (!_timerUnits) {
        _timerUnits = [[NSMutableArray alloc] init];
    }
    return _timerUnits;
}



#pragma mark - Actions

/**
 * backToMenu Action (?)
 *
 **/
- (IBAction) backToMenu:(UIBarButtonItem *) sender {
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int c=0; c < [viewControllers count]; c++) {
        id obj = [viewControllers objectAtIndex:c];
        if([obj isKindOfClass:[ThemeViewController class]])
            [self.navigationController popToViewController:obj animated:YES];    
    }
}



/**
 * clearButtonPressed Action (?)
 *
 **/
- (IBAction)ClearButtonPressed:(id)sender {
    [_mazeHelper reset];
    [self.slider setProgress:0.0];
}



-(void)pauseButtonTapped:(UIButton*)sender {
    [self stopTimer];
    UIView *pauseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pauseView.backgroundColor = [UIColor blackColor];
    pauseView.alpha = 0.9;
    [self.view addSubview:pauseView];
    
    UIImage *messagebox = [UIImage imageNamed:@"messagebox"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-messagebox.size.width/2, self.view.frame.size.height/2-messagebox.size.height/2, messagebox.size.width, messagebox.size.height)];
    imageView.image = messagebox;
    [self.view addSubview:imageView];
    
    UILabel *pause_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-messagebox.size.width/2, self.view.frame.size.height/2-messagebox.size.height/4, messagebox.size.width, messagebox.size.height/4)];
    pause_lable.text = @"GAME PAUSED";
    pause_lable.backgroundColor = [UIColor clearColor];
    pause_lable.font = [UIFont fontWithName:fontName size: fontSize+10];
    pause_lable.textColor = [UIColor whiteColor];
    pause_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:pause_lable];
    
    int halfViewSize = [self view].frame.size.width / 2;
    UIImage *image2 = [UIImage imageNamed:@"orange"];
    
    UIButton *continueButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image2.size.width -15, self.view.frame.size.height/2+messagebox.size.height/2+15, image2.size.width, image2.size.height)];
    [continueButton setBackgroundImage:image2 forState:UIControlStateNormal];
    [continueButton setTitle:@"CONTINUE" forState:UIControlStateNormal];
    continueButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    continueButton.titleLabel.textColor = [UIColor whiteColor];
    [continueButton addTarget:self action:@selector(continueButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    continueButton.tag = 1111;
    [self.view addSubview:continueButton];
    
    UIImage *image = [UIImage imageNamed:@"red"];
    
    UIButton *quitButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize +15, self.view.frame.size.height/2+messagebox.size.height/2+15, image2.size.width, image2.size.height)];    
    [quitButton setBackgroundImage:image forState:UIControlStateNormal];
    [quitButton setTitle:@"QUIT" forState:UIControlStateNormal];
    quitButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    quitButton.titleLabel.textColor = [UIColor whiteColor];
    [quitButton addTarget:self action:@selector(quitButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    quitButton.tag = 1111;
    [self.view addSubview:quitButton];
    
    [self.pauseViews addObject:pauseView];
    [self.pauseViews addObject:imageView];
    [self.pauseViews addObject:continueButton];
    [self.pauseViews addObject:quitButton];
    [self.pauseViews addObject:pause_lable];
}



-(void)continueButtonTapped:(UIButton*)sender {
    [self clearPauseWinLoseScreens];
    [self startTimer];
}



-(void)quitButtonTapped:(UIButton*)sender {
    [self backToMenu];
}



-(void)ShareButtonTapped:(UIButton*)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *facebookAutoPost = [prefs stringForKey:@"facebookAutoPost"];
    if ([facebookAutoPost isEqualToString:@"YES"]) {
        [self loginFacebook];
        [self postOnwallWithoutAsking];
    }else {
        [self loginFacebook];
        [self postOnFacebook];
    }
}




-(void)menuButtonTapped:(UIButton*)sender {
    [self backToMenu];
}



-(void)changeLevelButtonTapped:(UIButton*)sender {
    [self backToMazeView];
}



-(void)restartButtonTapped:(UIButton*)sender {
    [self clearPauseWinLoseScreens];
    [self clearTimer];
    [self addTimerUnitsToScreen];
    [self restartStar];
    [self restartScore];
    [self clearBothScreens];
    [self backToNormalScale];
    self.clickError = 0;
    self.clickOk = 0;
    [self startTimer];
}



#pragma mark - Gestures


/**
 * addGestures
 * 
 **/ 
-(void)addGestures {
    NSLog(@"addGestures Set!");
    
    UITapGestureRecognizer *tapGestureForLeftImage = 
    [[UITapGestureRecognizer alloc] 
     initWithTarget:self action:@selector(tapGestureHandlerForLeftView:)];
    UITapGestureRecognizer *tapGestureForRightImage = 
    [[UITapGestureRecognizer alloc] 
     initWithTarget:self action:@selector(tapGestureHandlerForRightView:)];
    
    /*
    [_rightScrollView addGestureRecognizer:tapGestureForRightImage];
    [_leftScrollView addGestureRecognizer:tapGestureForLeftImage];
     */
    [_rightImageView addGestureRecognizer:tapGestureForRightImage];
    [_leftImageView addGestureRecognizer:tapGestureForLeftImage];
}



/**
 * tapGestureHandlerForLeftView
 * 
 **/ 
-(void)tapGestureHandlerForLeftView:(UITapGestureRecognizer*)gesture  {
    
    CGPoint touchPosition = [gesture locationInView:_leftImageView];
    NSLog(@"Left Touch %f - %f", touchPosition.x, touchPosition.y);
    [self checkDiffMatchs:touchPosition inView:_leftImageView];
}



/**
 * tapGestureHandlerForRightView
 * 
 **/ 
-(void)tapGestureHandlerForRightView:(UITapGestureRecognizer*)gesture  {
    
    CGPoint touchPosition = [gesture locationInView:_rightImageView];
    NSLog(@"Right Touch %f - %f", touchPosition.x/[_mazeHelper viewSize].width, 
          touchPosition.y/[_mazeHelper viewSize].height);
    [self checkDiffMatchs:touchPosition inView:_rightImageView];
}



#pragma mark - Maze aware Methods

/*
 *
 * check if the clicked position matchs any spot predefined
 *
 */

-(void)checkDiffMatchs:(CGPoint)position inView:(MazeView*)view {
    
    NSLog(@"checkDiffMatchs %f - %f", position.x, position.y);
    Differences *difference = [_mazeHelper differenceFound:position];
    
    if (difference) { 
        [[SoundManager sharedSoundManager] playCheck];
        
        [CGMarkerHelper drawMarker:difference 
                            inView:view 
                          inBounds:[_mazeHelper viewSize]];
        
        [self updateScores];
        [self updateStars];
        
        self.clickOk++;
        return;
    } else {
        [[SoundManager sharedSoundManager] playErro];
        [self errorImageAnimation:position];    
        
        self.clickError++;
        if (self.clickError == 3) {
            [self stopTimer];
            [self gameLosed];
        }
    }
}



-(void)errorImageAnimation:(CGPoint)position {
    
    NSLog(@" Error in %f - %f", position.x, position.y);
    //float ratio = (_rightScrollView.frame.size.width / [_mazeHelper viewSize].width); 
    float positionX =  (position.x *[_rightScrollView zoomScale]) - _rightScrollView.contentOffset.x;
    float positionY = (position.y *[_rightScrollView zoomScale]) - _rightScrollView.contentOffset.y;
    float rightOriginX = _rightScrollView.frame.origin.x;
    float rightOriginY = _rightScrollView.frame.origin.y;
    
    UIImage *errorImg = [UIImage imageNamed:errorImage]; 
    UIImageView *imageview = [[UIImageView alloc] 
                              initWithFrame:CGRectMake(positionX+rightOriginX - errorImg.size.width/2, 
                                                       positionY+rightOriginY - errorImg.size.height/2, 
                                                       errorImg.size.width, 
                                                       errorImg.size.height)];
    [imageview setImage: errorImg];
    [self.view addSubview:imageview];
    
    UIImageView *imageviewLeft = [[UIImageView alloc] initWithFrame:CGRectMake(positionX - errorImg.size.width/2, positionY+29 -errorImg.size.height/2, errorImg.size.width, errorImg.size.height)];
    
    [imageviewLeft setImage: errorImg];
    [self.view addSubview:imageviewLeft];
    
    [UIView animateWithDuration:1.5 
                          delay:0.0 
                        options:UIViewAnimationOptionBeginFromCurrentState 
                     animations:^{imageviewLeft.alpha = 0.0;} 
                     completion:^(BOOL fin){
                         if (fin) 
                             [imageviewLeft removeFromSuperview];
                     }];
    
    [UIView animateWithDuration:1.5 
                          delay:0.0 
                        options:UIViewAnimationOptionBeginFromCurrentState 
                     animations:^{imageview.alpha = 0.0;} 
                     completion:^(BOOL fin){
                         if (fin) 
                             [imageview removeFromSuperview];
                     }];
}



-(void)updateScores {
    int score = self.score.tag + 50;
    self.score.tag = score;
    self.score.text = [self getNewScore:score];
}



-(int)getScoreByRemainingTime {
    return [self.timerUnits count] * [_mazeHelper getMazeAvailableTime] / 25 * [_mazeHelper getMazeRemainingTimeScoreByDifficulty];
}



-(NSString*)getNewScore:(int)score {
    int length = (score ==0) ? 1 : (int)log10(score) + 1;
    NSString *newScore = @"";
    for (int c = 0; c < 6 - length; c++) {
        newScore = [newScore stringByAppendingString:@"0"];
    }
    return [newScore stringByAppendingString:[NSString stringWithFormat:@"%d", score]];
}



-(void)updateStars {
    UIImageView *star = [self.stars lastObject];
    
    UIImage *starimage = [UIImage imageNamed:@"redstar"];
    UIImageView *starimageview = [[UIImageView alloc]initWithFrame:CGRectMake(star.frame.origin.x, 10, starimage.size.width, starimage.size.height)];
    starimageview.image = starimage;
    [self.view addSubview:starimageview];
    
    [self.redstars addObject:starimageview];
    
    star.hidden = YES;
    [star removeFromSuperview];
    [self.stars removeLastObject];
    
    if([self.stars count] == 0)
    {
        [self stopTimer];
        int timeLeft = [self getScoreByRemainingTime];
        int score = self.score.tag + timeLeft;
        if (self.clickError == 0) {
            score = score + [_mazeHelper getBonusScoreByDifficulty];
        }
        
        NSString *newScore = [self getNewScore:score];
        self.score.tag = score;
        self.score.text = newScore;
        
        [self gameWon];
    }
}



-(void)gameWon {
    [[SoundManager sharedSoundManager] playFinal];
    UIView *pauseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pauseView.backgroundColor = [UIColor blackColor];
    pauseView.alpha = 0.9;
    [self.view addSubview:pauseView];
    
    UIImage *messagebox = [UIImage imageNamed:@"messageboxOK"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-messagebox.size.width/2, self.view.frame.size.height/2-messagebox.size.height/2, messagebox.size.width, messagebox.size.height)];
    imageView.image = messagebox;
    [self.view addSubview:imageView];
    
    
    UILabel *pause_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-messagebox.size.width/2 + 50, self.view.frame.size.height/2-messagebox.size.height/4 -50, messagebox.size.width, messagebox.size.height)];
    pause_lable.numberOfLines = 0;
    pause_lable.text = [NSString stringWithFormat:@"LEVEL\nCOMPLETE!\nSCORE : %d",self.score.tag];
    pause_lable.backgroundColor = [UIColor clearColor];
    pause_lable.font = [UIFont fontWithName:fontName size: fontSize+10];
    pause_lable.textColor = [UIColor whiteColor];
    pause_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:pause_lable];
    
    int halfViewSize = [self view].frame.size.width / 2;
    UIImage *image2 = [UIImage imageNamed:@"orange"];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image2.size.width*1.5 -5, self.view.frame.size.height/2+messagebox.size.height/2+15, image2.size.width, image2.size.height)];
    [menuButton setBackgroundImage:image2 forState:UIControlStateNormal];
    [menuButton setTitle:@"MENU" forState:UIControlStateNormal];
    menuButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    menuButton.titleLabel.textColor = [UIColor whiteColor];
    [menuButton addTarget:self action:@selector(menuButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    menuButton.tag = 1111;
    [self.view addSubview:menuButton];
    
    UIImage *changeLevelImage = [UIImage imageNamed:@"red"];
    
    UIButton *changeLevelButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - changeLevelImage.size.width/2, self.view.frame.size.height/2+messagebox.size.height/2+15, changeLevelImage.size.width, changeLevelImage.size.height)];    
    [changeLevelButton setBackgroundImage:changeLevelImage forState:UIControlStateNormal];
    [changeLevelButton setTitle:@"CHANGE LEVEL" forState:UIControlStateNormal];
    changeLevelButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    changeLevelButton.titleLabel.textColor = [UIColor whiteColor];
    [changeLevelButton addTarget:self action:@selector(changeLevelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    changeLevelButton.tag = 1111;
    [self.view addSubview:changeLevelButton];
    
    UIImage *image = [UIImage imageNamed:@"wine"];
    
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize + image.size.width/2+5, self.view.frame.size.height/2+messagebox.size.height/2+15, image2.size.width, image2.size.height)];    
    [shareButton setBackgroundImage:image forState:UIControlStateNormal];
    [shareButton setTitle:@"SHARE" forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    shareButton.titleLabel.textColor = [UIColor whiteColor];
    [shareButton addTarget:self action:@selector(ShareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    shareButton.tag = 1111;
    [self.view addSubview:shareButton];
    
    pauseView.alpha = 0;
    imageView.alpha = 0;
    menuButton.alpha = 0;
    shareButton.alpha = 0;
    changeLevelButton.alpha = 0;
    pause_lable.alpha = 0;
    
    [self.pauseViews addObject:pauseView];
    [self.pauseViews addObject:imageView];
    [self.pauseViews addObject:menuButton];
    [self.pauseViews addObject:shareButton];
    [self.pauseViews addObject:changeLevelButton];
    [self.pauseViews addObject:pause_lable];
    
    [UIView animateWithDuration:0.5 
                          delay:0.0 
                        options:UIViewAnimationOptionBeginFromCurrentState 
                     animations:^{
                         pauseView.alpha = 1;
                         imageView.alpha = 1;
                         menuButton.alpha = 1;
                         shareButton.alpha = 1;
                         changeLevelButton.alpha = 1;
                         pause_lable.alpha = 1;
                         
                     } 
                     completion:^(BOOL fin){
                     }];
}



#pragma mark - Social Integration



-(void)sendTwitter {
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet = 
        [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:
         @"Tweeting from iOS 5 By Pdmfc! :)"];
	    [self presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] 
                                  initWithTitle:@"Sorry"                                                             
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"                                                          
                                  delegate:self                                              
                                  cancelButtonTitle:@"OK"                                                   
                                  otherButtonTitles:nil];
        [alertView show];
    }
}



-(void)postOnwallWithoutAsking {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate postOnwallWithoutAsking];
}



-(void)logoutFacebook {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate facebookLogout];
}



-(void)loginFacebook {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate facebookLogin];
}



-(void)postOnFacebook {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate postOnWall];
}




-(void)backToNormalScale {
    
    [self.leftScrollView setZoomScale: [_mazeHelper initialZoomScale]];
    [self.rightScrollView setZoomScale: [_mazeHelper initialZoomScale]];
}




#pragma mark - ScrollView Delegate 

/**
 * 
 *
 */
-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (scrollView.tag == 1 && scrollView.zooming) {
        [_leftScrollView setZoomScale: scrollView.zoomScale];
        [_leftScrollView setContentOffset: scrollView.contentOffset]; 
        
    } else if(scrollView.tag == 2 && scrollView.zooming) {
        [_rightScrollView setZoomScale: scrollView.zoomScale];    
        [_rightScrollView setContentOffset: scrollView.contentOffset];
    }
}



/**
 * 
 *
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(!scrollView.zooming) {
        if (scrollView.tag == 1 && scrollView.dragging) {
            [_leftScrollView setContentOffset: scrollView.contentOffset];
        } else if (scrollView.tag == 2 && scrollView.dragging) {
            [_rightScrollView setContentOffset: scrollView.contentOffset];
        }
    }
}



- (CGRect)zoomRectForScrollView:(UIScrollView *)scrollView 
                      withScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    
    zoomRect.size.height = scrollView.frame.size.height / scale;
    zoomRect.size.width  = scrollView.frame.size.width  / scale;
    
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}



-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    UIView* result = _rightImageView;
    if (scrollView.tag != 1) {
        result = _leftImageView;
    }
    
    return result;
}




/*
 *
 *  timer actions
 *
 */
-(void)timerCall:(NSTimer *)timer {
    
    if ([self.timerUnits count] > 0) {
        UIImageView *timerunit = [self.timerUnits lastObject];
        timerunit.hidden = YES;
        [timerunit removeFromSuperview];
        [self.timerUnits removeLastObject];
    }else {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        NSString *remainingTime = [prefs stringForKey:@"autoExtendsTime"];
        if ([remainingTime isEqualToString:@"YES"]) {
            [self stopTimer];
            [self addTimerUnitsToScreen];
            [self startTimer];
        }else {
            [self stopTimer];
            [self gameLosed];
        }
    }
}



-(void)gameLosed {
    UIView *pauseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pauseView.backgroundColor = [UIColor blackColor];
    pauseView.alpha = 0.9;
    [self.view addSubview:pauseView];
    
    UIImage *messagebox = [UIImage imageNamed:@"messageboxFail"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-messagebox.size.width/2, self.view.frame.size.height/2-messagebox.size.height/2, messagebox.size.width, messagebox.size.height)];
    imageView.image = messagebox;
    [self.view addSubview:imageView];
    
    NSString *gameLoseText;
    if (self.clickError >= 3) {
        gameLoseText = @"YOU LOST ...";
    }else {
        gameLoseText = @"TIME'S UP!";
    }
    
    UILabel *pause_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-messagebox.size.width/2 + 50, self.view.frame.size.height/2-messagebox.size.height/4 + 15, messagebox.size.width, messagebox.size.height/4)];
    pause_lable.text = gameLoseText;
    pause_lable.backgroundColor = [UIColor clearColor];
    pause_lable.font = [UIFont fontWithName:fontName size: fontSize+10];
    pause_lable.textColor = [UIColor whiteColor];
    pause_lable.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:pause_lable];
    
    int halfViewSize = [self view].frame.size.width / 2;
    UIImage *image2 = [UIImage imageNamed:@"orange"];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - image2.size.width*1.5 -5, self.view.frame.size.height/2+messagebox.size.height/2+15, image2.size.width, image2.size.height)];
    [menuButton setBackgroundImage:image2 forState:UIControlStateNormal];
    [menuButton setTitle:@"MENU" forState:UIControlStateNormal];
    menuButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    menuButton.titleLabel.textColor = [UIColor whiteColor];
    [menuButton addTarget:self action:@selector(menuButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    menuButton.tag = 1111;
    [self.view addSubview:menuButton];
    
    UIImage *changeLevelImage = [UIImage imageNamed:@"red"];
    
    UIButton *changeLevelButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize - changeLevelImage.size.width/2, self.view.frame.size.height/2+messagebox.size.height/2+15, changeLevelImage.size.width, changeLevelImage.size.height)];    
    [changeLevelButton setBackgroundImage:changeLevelImage forState:UIControlStateNormal];
    [changeLevelButton setTitle:@"CHANGE LEVEL" forState:UIControlStateNormal];
    changeLevelButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    changeLevelButton.titleLabel.textColor = [UIColor whiteColor];
    [changeLevelButton addTarget:self action:@selector(changeLevelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    changeLevelButton.tag = 1111;
    [self.view addSubview:changeLevelButton];
    
    UIImage *image = [UIImage imageNamed:@"wine"];
    
    UIButton *restartButton = [[UIButton alloc] initWithFrame:CGRectMake(halfViewSize + image.size.width/2+5, self.view.frame.size.height/2+messagebox.size.height/2+15, image2.size.width, image2.size.height)];    
    [restartButton setBackgroundImage:image forState:UIControlStateNormal];
    [restartButton setTitle:@"RESTART" forState:UIControlStateNormal];
    restartButton.titleLabel.font = [UIFont fontWithName:fontName size: fontSize];
    restartButton.titleLabel.textColor = [UIColor whiteColor];
    [restartButton addTarget:self action:@selector(restartButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    restartButton.tag = 1111;
    [self.view addSubview:restartButton];
    
    pauseView.alpha = 0;
    imageView.alpha = 0;
    menuButton.alpha = 0;
    restartButton.alpha = 0;
    changeLevelButton.alpha = 0;
    pause_lable.alpha = 0;
    
    
    [self.pauseViews addObject:pauseView];
    [self.pauseViews addObject:imageView];
    [self.pauseViews addObject:menuButton];
    [self.pauseViews addObject:restartButton];
    [self.pauseViews addObject:changeLevelButton];
    [self.pauseViews addObject:pause_lable];
    
    [UIView animateWithDuration:0.5 
                          delay:0.0 
                        options:UIViewAnimationOptionBeginFromCurrentState 
                     animations:^{
                         pauseView.alpha = 1;
                         imageView.alpha = 1;
                         menuButton.alpha = 1;
                         restartButton.alpha = 1;
                         changeLevelButton.alpha = 1;
                         pause_lable.alpha = 1;
                         
                     } 
                     completion:^(BOOL fin){
                     }];
}



-(void)backToMenu {
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int c=0; c < [viewControllers count]; c++) {
        id obj = [viewControllers objectAtIndex:c];
        if([obj isKindOfClass:[InicialViewController class]])
            [self.navigationController popToViewController:obj animated:YES];    
    }
}



-(void)backToMazeView {
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int c=0; c < [viewControllers count]; c++) {
        id obj = [viewControllers objectAtIndex:c];
        if([obj isKindOfClass:[ImagesForThemeCarouselViewController class]])
            [self.navigationController popToViewController:obj animated:YES];    
    }
}


#pragma mark - Timer 

-(void)startTimer {
    float interval = [_mazeHelper getMazeAvailableTime] / 25;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval 
                                                  target:self 
                                                selector:@selector(timerCall:) 
                                                userInfo:nil 
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}



-(void)stopTimer {
    [self.timer invalidate];
}



-(void)clearTimer {
    while ([self.timerUnits count]> 0) {
        UIView *view = [self.timerUnits lastObject];
        [view removeFromSuperview];
        [self.timerUnits removeLastObject];
    }
}



-(void)addTimerUnitsToScreen {
    for (int c =0; c<25; c++) {
        UIImage *timerimage = [UIImage imageNamed:@"timer_unit"];
        UIImageView *timerimageview = [[UIImageView alloc]initWithFrame:CGRectMake(30+offset*c, 10, timerimage.size.width, timerimage.size.height)];
        timerimageview.image = timerimage;
        [self.view addSubview:timerimageview];
        [self.timerUnits addObject:timerimageview];
    } 
}



-(void)clearPauseWinLoseScreens {
    while ([self.pauseViews count]> 0) {
        UIView *view = [self.pauseViews lastObject];
        [view removeFromSuperview];
        [self.pauseViews removeLastObject];
    }
}



#pragma mark - View Specific Methods 

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.slider setProgress:1.0];
    
    UIImage *rightImage = [_mazeHelper getRightImage];
    UIImage *leftImage = [_mazeHelper getLeftImage];
    
    [_rightImageView setImage:rightImage];
    [_leftImageView setImage:leftImage];
    
    float minimumScale = _rightImageView.frame.size.width / rightImage.size.width;
    [_mazeHelper setInitialZoomScale:minimumScale];
    [_mazeHelper setViewSize:rightImage.size];
    
    _rightImageView.frame = 
        CGRectMake(0, 0, rightImage.size.width, rightImage.size.height);
    _leftImageView.frame = 
        CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
    
    float initialZoomScale = [_mazeHelper initialZoomScale];
    float maximumZoomScale = (initialZoomScale * [_mazeHelper getMazeZoomFactor]);
    
    [_leftScrollView setMaximumZoomScale:maximumZoomScale];
    [_leftScrollView setMinimumZoomScale: initialZoomScale];
    [_leftScrollView setZoomScale:initialZoomScale];
    
    [_rightScrollView setMaximumZoomScale:maximumZoomScale];
    [_rightScrollView setMinimumZoomScale:initialZoomScale];
    [_rightScrollView setZoomScale:initialZoomScale];
    
    
    self.clickOk = 0;
    self.clickError = 0;
    
    UIImage *image = [UIImage imageNamed:@"gametopbar"];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width , image.size.height)];
    imageview.image = image;
    
    [self.view addSubview:imageview];
    
    
    [self addTimerUnitsToScreen];
    
    UIImage *pauseimage = [UIImage imageNamed:@"pause"];
    UIButton *pausebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pausebutton setImage:pauseimage forState:UIControlStateNormal];
    [pausebutton setFrame:CGRectMake(self.view.frame.size.width - pauseimage.size.width -20, -2,pauseimage.size.width+20, pauseimage.size.height+17)];
    [pausebutton addTarget:self action:@selector(pauseButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pausebutton];
    
    UILabel *score_lable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 120, 3, 90, 25)];
    score_lable.text = @"000000";
    score_lable.backgroundColor = [UIColor clearColor];
    score_lable.font = [UIFont fontWithName:fontName size: fontSize+5];
    score_lable.textColor = [UIColor whiteColor];
    score_lable.tag = 0;
    [self.view addSubview:score_lable];
    self.score = score_lable;
    
    [self restartStar];
    
    
    [self startTimer];
    
    
    /*
    for (int c=0; c < [_mazeHelper.mazeDifferences count]; c++) {
        Differences *difference = [_mazeHelper.mazeDifferences objectAtIndex:c];
        
        //Helper
        [CGMarkerHelper drawMarker:difference inView:_rightImageView 
                          inBounds:rightImage.size];
    }
    */
     
}



-(void)viewWillDisappear:(BOOL)animated {
    [self stopTimer];
    [super viewWillDisappear:animated];
}



-(void)viewDidLoad {
    [super viewDidLoad];     
    _rightScrollView.delegate = self;
    _leftScrollView.delegate = self;
    
    [self addGestures];
}



-(void)viewDidUnload {
    /*
     [self setRightScrollView: nil];
     [self setLeftScrollView: nil];    
     [self setRightImageView: nil];
     [self setLeftImageView: nil];
     */
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}





@end
