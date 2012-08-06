/*
 *  CGMarkerHelper.h
 *  SpotDiferences
 *
 *  Copyright 2012 Go4Mobility
 *
 */

#import "MazeView.h"
#import "Differences.h"

@interface CGMarkerHelper : NSObject

+(void)drawMarkerWithPoint:(CGPoint)point inView:(MazeView*)view; 
+(void)drawMarker:(Differences*)difference inView:(MazeView*)view 
         inBounds:(CGSize)size ; 
+(void)drawMarker:(Differences*)difference inView:(MazeView*)view 
         inBounds:(CGSize)size;


@end
