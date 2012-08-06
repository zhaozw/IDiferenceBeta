//
//  ImageDetailViewController.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Maze.h"

@interface ImageDetailViewController : UIViewController

@property (nonatomic,weak) NSString *foto;
@property (nonatomic,weak) Maze *maze;
@property (nonatomic, weak)IBOutlet UIManagedDocument *document;

@end
