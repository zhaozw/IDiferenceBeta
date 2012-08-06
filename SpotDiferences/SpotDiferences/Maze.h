//
//  Maze.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DifferenceFotos, Difficulty, Theme;

@interface Maze : NSManagedObject

@property (nonatomic, retain) NSNumber * besttimeminute;
@property (nonatomic, retain) NSNumber * besttimesecund;
@property (nonatomic, retain) NSNumber * expectedtimeminute;
@property (nonatomic, retain) NSNumber * expectedtimesecund;
@property (nonatomic, retain) NSNumber * highestscore;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * personalscore;
@property (nonatomic, retain) NSSet *differenceFotos;
@property (nonatomic, retain) Difficulty *dificulty;
@property (nonatomic, retain) Theme *theme;
@end

@interface Maze (CoreDataGeneratedAccessors)

- (void)addDifferenceFotosObject:(DifferenceFotos *)value;
- (void)removeDifferenceFotosObject:(DifferenceFotos *)value;
- (void)addDifferenceFotos:(NSSet *)values;
- (void)removeDifferenceFotos:(NSSet *)values;
@end
