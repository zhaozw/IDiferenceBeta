//
//  Differences.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DifferenceFotos;

@interface Differences : NSManagedObject

@property (nonatomic, retain) NSNumber * centerX;
@property (nonatomic, retain) NSNumber * centerY;
@property (nonatomic, retain) NSNumber * downrightX;
@property (nonatomic, retain) NSNumber * downrightY;
@property (nonatomic, retain) NSNumber * upleftX;
@property (nonatomic, retain) NSNumber * upleftY;
@property (nonatomic, retain) DifferenceFotos *foto;

@end
