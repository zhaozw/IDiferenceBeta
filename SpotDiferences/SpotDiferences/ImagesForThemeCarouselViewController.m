//
//  ImagesForThemeCarouselViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImagesForThemeCarouselViewController.h"
#import "ImageDetailViewController.h"
#import "Maze+Manage.h"
#import "MyDocumentHandler.h"
#import "SoundManager.h"

#define NUMBER_OF_ITEMS 19
#define ITEM_SPACING 210
#define USE_BUTTONS YES
#define image_holder @"levelimageholder_old"
#define choose_level @"txtselectlevel.png"


@interface ImagesForThemeCarouselViewController () <UIActionSheetDelegate>

@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, weak) NSString *segueValue;
@end


@implementation ImagesForThemeCarouselViewController

@synthesize carousel;
@synthesize navItem;
@synthesize wrap;
@synthesize items;
@synthesize segueValue = _segueValue;
@synthesize theme = _theme;
@synthesize document = _document;
@synthesize pagecontrol = _pagecontrol;
@synthesize mazes = _mazes;

- (void)setUp
{
    wrap = NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [[MyDocumentHandler sharedDocumentHandler] performWithDocument:^(UIManagedDocument *document){
            _document = document;
        }];
        [self setUp];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    wrap = NO;
	
	UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
	backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	backgroundView.image = [UIImage imageNamed:@"background.png"];
	[self.view addSubview:backgroundView];
	
	self.carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
	carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carousel.type = iCarouselTypeLinear;
	carousel.delegate = self;
	carousel.dataSource = self;
    
	[self.view addSubview:carousel];
    
    self.mazes = [Maze getMaze:self.theme inManagedObjectContext:self.document.managedObjectContext];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
    self.navItem = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    for (UIView *view in carousel.visibleViews)
    {
        view.alpha = 1.0;
    }
    carousel.type = buttonIndex;
    navItem.title = [actionSheet buttonTitleAtIndex:buttonIndex];
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    int numero = [self.mazes count];

    self.items = [NSMutableArray array];
    for (int i = 0; i < numero; i++)
    {
        [items addObject:[NSNumber numberWithInt:i]];
    }
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *difficulty = [prefs stringForKey:@"difficulty"];
    NSArray *mazeso = [Maze getMazeByThemeAndDifficulty:self.theme difficulty:difficulty inManagedObjectContext:self.document.managedObjectContext];
    return [mazeso count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{    
    if (!self.mazes) {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *difficulty = [prefs stringForKey:@"difficulty"];
        
        self.mazes = [Maze getMazeByThemeAndDifficulty:self.theme difficulty:difficulty inManagedObjectContext:self.document.managedObjectContext];
    }
    
    Maze *maze = [self.mazes objectAtIndex:index];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    UIImage *background = [UIImage imageNamed: image_holder];
    [button setBackgroundImage:background forState:UIControlStateNormal];
    
    button.tag = index;
    button.accessibilityValue = maze.name;
    
    dispatch_queue_t Queue = dispatch_queue_create("queue", NULL);
    dispatch_async(Queue, ^{
        UIImage *normalImage = [UIImage imageNamed: image_holder];
        UIImage *normalImage2 = [UIImage imageNamed: maze.name];
        
        UIGraphicsBeginImageContext( CGSizeMake(normalImage.size.width, normalImage.size.height) );
        [normalImage drawInRect:CGRectMake(0,0,normalImage.size.width,normalImage.size.height)];
        [normalImage2 drawInRect:CGRectMake(20,20,normalImage.size.width - 40,normalImage.size.height -40)];
        
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [button setBackgroundImage:image forState:UIControlStateNormal];
        });
    });
    
    dispatch_release(Queue);
    
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];    
    return button;
}

- (float)carouselItemWidth:(iCarousel *)carousel
{
    return ITEM_SPACING;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(float)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return wrap;
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    self.title = [NSString stringWithFormat:@"%d", self.carousel.currentItemIndex];
    int c = self.carousel.currentItemIndex / 3;
    self.pagecontrol.currentPage = c;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ImageDetailViewController* idc = segue.destinationViewController;
    idc.foto = self.segueValue;
    [idc setDocument:self.document];
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[SoundManager sharedSoundManager] playIntro];
    int halfViewSize = [self view].frame.size.width / 2;
    
    UIImage *choosethemeimage = [UIImage imageNamed:choose_level]; 
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(halfViewSize - choosethemeimage.size.width/2, 20, choosethemeimage.size.width, choosethemeimage.size.height)];
    imageview.image = choosethemeimage;
    [self.view addSubview:imageview];
    
    UIImage *bimage = [UIImage imageNamed:@"back.png"];

    UIButton *bbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, bimage.size.width, bimage.size.height)];
    [bbutton setBackgroundImage:bimage forState:UIControlStateNormal];
    [bbutton setTitle:@"" forState:UIControlStateNormal];
    [bbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bbutton.titleLabel.font = [bbutton.titleLabel.font fontWithSize:50];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    bbutton.tag = 1111;
    [self.view addSubview:bbutton];
    
    if(!self.pagecontrol){
        int number_of_itens = self.carousel.numberOfItems;
        UIPageControl *pagecontrol = [[UIPageControl alloc] initWithFrame:CGRectMake(221, 280, 38, 36)];
        if (number_of_itens % 3 == 0)
            pagecontrol.numberOfPages = number_of_itens / 3;
        else {
            pagecontrol.numberOfPages = number_of_itens / 3 +1;
        }
        pagecontrol.currentPage = 0;
        pagecontrol.userInteractionEnabled = NO;
        self.pagecontrol = pagecontrol;
        [self.view addSubview:pagecontrol]; 
    }
}

-(void)playInterfaceSound
{
    [[SoundManager sharedSoundManager] playInterface];
}

-(void)backButtonTapped:(UIButton*)sender
{
    [self playInterfaceSound];
    [[self navigationController]popViewControllerAnimated:YES];
}

- (void)buttonTapped:(UIButton *)sender
{
    [self playInterfaceSound];
    self.segueValue = sender.accessibilityValue;
    [self performSegueWithIdentifier:@"show detail view" sender:self];
}

@end
