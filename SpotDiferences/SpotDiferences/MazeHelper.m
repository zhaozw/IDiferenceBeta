/*
 *  MazeHelper.m
 *  SpotDiferences
 *
 *  Copyright 2012 Go4Mobility
 *
 */

#import "MazeHelper.h"
#import "Differences.h"
#import "CGMarkerHelper.h"

@implementation MazeHelper

@synthesize mazeImage = _mazeImage;
@synthesize initialZoomScale = _initialZoomScale;
@synthesize viewSize = _viewSize;
@synthesize mazeDifferences  = _mazeDifferences;
@synthesize availableDifferences = _availableDifferences;




/** 
 * Init from the current maze, scrollViewSize, 
 * and differences Array
 *
 **/
+(MazeHelper *) initWith:(Maze *)maze
         mazeDifferences:(NSMutableArray *)differences {
    
    MazeHelper *currentInstance = [[MazeHelper alloc] init];

    [currentInstance setAvailableDifferences: [[NSMutableArray alloc] initWithArray:differences]];
    [currentInstance setMazeDifferences: [[NSMutableArray alloc] initWithArray:differences]];
    [currentInstance setMazeImage:maze.name];
    
    return currentInstance;
}


/**
 * convert to point a giving percentage
 *
 **/
-(CGPoint) percentageToPoint:(float)percentageX yValue:(float)percentageY {
    
    return CGPointMake((_viewSize.width ) * percentageX, 
                       (_viewSize.height ) * percentageY);
}



/**
 * check if the clicked position matchs any spot predefined
 *
 */
-(Differences*) differenceFound:(CGPoint)position {
    
    Differences *result = nil;
    
    for (int c=0; c < [_availableDifferences count]; c++) {
        Differences *difference = [_availableDifferences objectAtIndex:c];
        float topleftX = [difference.upleftX floatValue] / 100;
        float topleftY = [difference.upleftY floatValue]/ 100;
        float downrightX = [difference.downrightX floatValue]/ 100;
        float downrightY = [difference.downrightY floatValue]/ 100;
        
        CGPoint topLeft = [self percentageToPoint:topleftX yValue:topleftY] ;
        CGPoint bottomRight = [self percentageToPoint:downrightX yValue:downrightY];
       
        BOOL matched = [self checkMatch: position 
                        topLeftPosition: topLeft
                      downRightPosition: bottomRight];
        
        if ( matched ) {
            [_availableDifferences removeObjectAtIndex:c];
            result = difference;
            break;
        }
    }
    
    return result;
    
}




/**
 * check if the clicked position is inside a giving area
 *
 **/
-(BOOL)checkMatch:(CGPoint)clickedPosition
  topLeftPosition:(CGPoint)topLeft downRightPosition:(CGPoint)downRight {
    
    BOOL result = clickedPosition.x > topLeft.x && clickedPosition.y > topLeft.y && clickedPosition.x < downRight.x && clickedPosition.y < downRight.y;
    
    return result;
}



/**
 * check if the clicked position is inside a giving area
 *
 **/
-(int)getMazeZoomFactor {
   
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *difficulty = [prefs stringForKey:@"difficulty"];
    if ([difficulty isEqualToString:@"detective"]) {
        return 3;
    } else {
        return 1;
    }
}




-(int)getMazeAvailableTime {

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *difficulty = [prefs stringForKey:@"difficulty"];
    if ([difficulty isEqualToString:@"beginner"]) {
        return 150;
    }else if ([difficulty isEqualToString:@"intermediate"]){
        return 120;
    }else if ([difficulty isEqualToString:@"expert"]){
        return 90;
    }
    
    return 60;
}



-(int)getMazeRemainingTimeScoreByDifficulty {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *difficulty = [prefs stringForKey:@"difficulty"];
    if ([difficulty isEqualToString:@"beginner"]) {
        return 1;
    }else if ([difficulty isEqualToString:@"intermediate"]){
        return 3;
    }else if ([difficulty isEqualToString:@"expert"]){
        return 5;
    }
    
    return 10;
}



-(UIImage*)getRightImage {
    UIImage *result = [self getImageWithNameFormat:@"%@A"];
    
    return result;
}



-(UIImage*)getLeftImage {
    UIImage *result = [self getImageWithNameFormat:@"%@"];
    
    return result;
}


-(UIImage*)getImageWithNameFormat:(NSString *)nameFormat { 
    UIImage *result = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg",
                                           [NSString stringWithFormat:nameFormat,_mazeImage]]];
    if (!result) {
        result = [UIImage imageNamed:[NSString stringWithFormat:nameFormat,_mazeImage]];
    }
    
    return result;
    
}

-(void)reset {

    _availableDifferences = [[NSMutableArray alloc] initWithArray:_mazeDifferences];
}



-(int)getBonusScoreByDifficulty {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *difficulty = [prefs stringForKey:@"difficulty"];
    if ([difficulty isEqualToString:@"beginner"]) {
        return 100;
    } else if ([difficulty isEqualToString:@"intermediate"]){
        return 150;
    } else if ([difficulty isEqualToString:@"expert"]){
        return 200;
    }
    
    return 250;
}



@end
