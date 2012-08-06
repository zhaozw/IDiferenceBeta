//
//  DifferenceFotos.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Differences, Maze;

@interface DifferenceFotos : NSManagedObject

@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *differences;
@property (nonatomic, retain) Maze *originalFoto;
@end

@interface DifferenceFotos (CoreDataGeneratedAccessors)

- (void)addDifferencesObject:(Differences *)value;
- (void)removeDifferencesObject:(Differences *)value;
- (void)addDifferences:(NSSet *)values;
- (void)removeDifferences:(NSSet *)values;

@end
