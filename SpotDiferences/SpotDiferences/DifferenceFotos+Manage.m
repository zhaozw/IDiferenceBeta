//
//  DifferenceFotos+Manage.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DifferenceFotos+Manage.h"


/**
 *
 *
 **/
@implementation DifferenceFotos (Manage)


/**
 *
 *
 **/
+ (DifferenceFotos *)createDifferenceFoto:(NSString *)name
                                  forMaze:(Maze *)maze
                   inManagedObjectContext:(NSManagedObjectContext *)context {
    
    DifferenceFotos *differenceFotos = nil;
    
    NSFetchRequest *request = 
        [NSFetchRequest fetchRequestWithEntityName:@"DifferenceFotos"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    NSSortDescriptor *sortDescriptor = 
        [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    if(!matches || ([matches count]>1)){
        
    } else if ([matches count] == 0){
        differenceFotos = [NSEntityDescription insertNewObjectForEntityForName:@"DifferenceFotos" inManagedObjectContext:context];
        differenceFotos.name = name;
        differenceFotos.originalFoto = maze;
    } else {
        differenceFotos = [matches lastObject];
    } 
    
    
    return differenceFotos;
}


/**
 *
 *
 **/
+ (NSSet*)getDiffs:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *request = 
        [NSFetchRequest fetchRequestWithEntityName:@"DifferenceFotos"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    NSSortDescriptor *sortDescriptor = 
        [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    if([matches count] > 0) {
        DifferenceFotos *foto = [matches objectAtIndex:0];
        return foto.differences;
    }
        
    return nil;

}

@end
