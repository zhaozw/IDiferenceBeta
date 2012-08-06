//
//  Maze+Manage.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Maze.h"

@interface Maze (Manage)
+ (Maze *)createMaze:(NSString *)name
            forTheme:(Theme *)theme
inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)getMazeByThemeAndDifficulty:(NSString *)theme
                              difficulty:(NSString *)difficulty
                  inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)getAllMazes:(NSManagedObjectContext *)context;
+ (NSArray *)getMaze:(NSString *)theme
inManagedObjectContext:(NSManagedObjectContext *)context;
+ (Maze *)getMazeByName:(NSString *)name
 inManagedObjectContext:(NSManagedObjectContext *)context;
@end
