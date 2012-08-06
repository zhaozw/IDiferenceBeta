//
//  Difficulty.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Maze;

@interface Difficulty : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *fotos;
@end

@interface Difficulty (CoreDataGeneratedAccessors)

- (void)addFotosObject:(Maze *)value;
- (void)removeFotosObject:(Maze *)value;
- (void)addFotos:(NSSet *)values;
- (void)removeFotos:(NSSet *)values;

@end
