//
//  ThemeViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThemeViewController.h"
#import "MyDocumentHandler.h"
#import "Theme+Create.h"
#import "Maze+Manage.h"
#import "ImagesForThemeCarouselViewController.h"
#import "Difficulty+Manage.h"
#import "SoundManager.h"

#define NUMBER_OF_ITEMS 3
#define ITEM_SPACING 210
#define USE_BUTTONS YES
#define image_holder @"levelimageholder_old"
#define fontSize 25
#define fontName @"Helvetica-Bold"
#define choose_theme @"txtselecttheme.png"

@interface ThemeViewController ()<UIActionSheetDelegate>
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic ,weak) UIActivityIndicatorView *spinner;
@end

@implementation ThemeViewController

@synthesize carousel;
@synthesize navItem;
@synthesize wrap;
@synthesize items;
@synthesize document = _document;
@synthesize themes = _themes;
@synthesize pagecontrol = _pagecontrol;
@synthesize spinner = _spinner;

-(void)awakeFromNib
{
    NSLog(@"inside awakeFromNib%d",[[self themes] count]);
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    [[MyDocumentHandler sharedDocumentHandler] performWithDocument:^(UIManagedDocument *document){
        _document = document;
    }];
    
    if ((self = [super initWithCoder:aDecoder]))
    {
        //code here
    }
    return self;
}
 
- (void)viewDidLoad
{
    [super viewDidLoad];

    wrap = YES;
	
	UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
	backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	backgroundView.image = [UIImage imageNamed:@"background"];
	[self.view addSubview:backgroundView];
	
	self.carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
	carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carousel.type = iCarouselTypeLinear;
	carousel.delegate = self;
	carousel.dataSource = self;
    
	[self.view addSubview:carousel];
    Theme *theme = [[self themes] objectAtIndex:0];
    self.title = [NSString stringWithFormat:@"%@", theme.name];
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
    self.items = [NSMutableArray array];
    int count = [[self themes] count];
    for (int i = 0; i < count; i++)
    {
        [items addObject:[NSNumber numberWithInt:i]];
    }
    return count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    Theme *theme = [[self themes] objectAtIndex:index];
    
    NSString *fotoPath = theme.foto;
    UIImage *image = [UIImage imageNamed: fotoPath];
    
    UILabel *score_lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, image.size.width,image.size.height)];
    score_lable.text = [theme.name capitalizedString];
    score_lable.backgroundColor = [UIColor clearColor];
    score_lable.font = [UIFont fontWithName:fontName size: fontSize];
    score_lable.textColor = [UIColor grayColor];
    score_lable.textAlignment = UITextAlignmentCenter;
     
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = index;
    [button addSubview:score_lable];
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

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    Theme *theme = [[self themes] objectAtIndex:self.carousel.currentItemIndex];
    self.title = [NSString stringWithFormat:@"%@", theme.name];
    int c = self.carousel.currentItemIndex / 3;
    self.pagecontrol.currentPage = c;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[SoundManager sharedSoundManager] playIntro];
    int halfViewSize = [self view].frame.size.width / 2;
    
    UIImage *choosethemeimage = [UIImage imageNamed:choose_theme]; 
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(halfViewSize - choosethemeimage.size.width/2, 20, choosethemeimage.size.width, choosethemeimage.size.height)];
    imageview.image = choosethemeimage;
    [self.view addSubview:imageview];
    
    UIImage *bimage = [UIImage imageNamed:@"back.png"];
    NSLog(@"scale is %f",bimage.scale);
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Theme *theme = [[self themes] objectAtIndex:self.carousel.currentItemIndex];
    ImagesForThemeCarouselViewController *iftvc = (ImagesForThemeCarouselViewController *)segue.destinationViewController;
    iftvc.theme = theme.name;
    iftvc.document = self.document;
}

-(void)performSegueForActivity
{
    [self performSegueWithIdentifier:@"show fotos for theme" sender:self]; 
}

- (void)buttonTapped:(UIButton *)sender
{   
    [self playInterfaceSound]; 
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.frame = CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height/2-150, 300, 300);
    
    [self.view addSubview:spinner];
    [spinner startAnimating];
    self.spinner = spinner;
    [self performSelector:@selector(performSegueForActivity) withObject:nil afterDelay:0];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.spinner stopAnimating];
    [super viewDidDisappear:animated];
}

@end
