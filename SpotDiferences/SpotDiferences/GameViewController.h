/*
 *  GameViewController.h
 *  SpotDiferences
 *
 *  Copyright 2012 Go4Mobility
 *
 */

#import <UIKit/UIKit.h>
#import "MazeHelper.h"

/**
 *
 * Game Controller
 *
 */
@interface GameViewController : UIViewController

@property (nonatomic) MazeHelper *mazeHelper;

- (void) setupWith:(Maze*)maze andContext:(NSManagedObjectContext *)context;

@end
