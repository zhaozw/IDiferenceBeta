//
//  Maze+Manage.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Maze+Manage.h"

@implementation Maze (Manage)

+ (Maze *)createMaze:(NSString *)name
            forTheme:(Theme *)theme
inManagedObjectContext:(NSManagedObjectContext *)context
{
    Maze *maze = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Maze"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
     if(!matches || ([matches count]>1)){
   
    }else if ([matches count] == 0){
        maze = [NSEntityDescription insertNewObjectForEntityForName:@"Maze" inManagedObjectContext:context];
        maze.name = name;
        maze.theme = theme;
    }else {
        maze = [matches lastObject];
    } 
    
    
    return maze;
}

+ (NSArray *)getAllMazes:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Maze"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    if([matches count] > 0)
        return matches;
    return nil;

}

+ (NSArray *)getMazeByThemeAndDifficulty:(NSString *)theme
                              difficulty:(NSString *)difficulty
                  inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Maze"];
    request.predicate = [NSPredicate predicateWithFormat:@"(dificulty.name = %@) AND (theme.name = %@)",difficulty,theme];
    //request.predicate = [NSPredicate predicateWithFormat:@"theme.name = %@",theme];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    if([matches count] > 0)
        return matches;
    return nil;
}

+ (NSArray *)getMaze:(NSString *)theme
inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Maze"];
    request.predicate = [NSPredicate predicateWithFormat:@"theme.name = %@", theme];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    if([matches count] > 0)
        return matches;
    return nil;
}
+ (Maze *)getMazeByName:(NSString *)name
    inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Maze"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError * error = nil;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    if([matches count] > 0)
        return [matches objectAtIndex:0];
    return nil;

}
@end
