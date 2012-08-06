//
//  DifferenceFotos+Manage.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DifferenceFotos.h"

@interface DifferenceFotos (Manage)

+ (DifferenceFotos *)createDifferenceFoto:(NSString *)name
                                  forMaze:(Maze *)maze
                   inManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSSet*)getDiffs:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context;

@end
