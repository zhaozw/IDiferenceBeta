//
//  Seed.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Seed.h"
#import "Theme+Create.h"
#import "Maze+Manage.h"
#import "DifferenceFotos+Manage.h"
#import "Differences+Manage.h"
#import "Difficulty+Manage.h"

@implementation Seed

+(void)insertDiffs:(int)topX
              topY:(int)topY
             downX:(int)downX
             downY:(int)downY
           centerX:(int)centerX
           centerY:(int)centerY
         diffFotos:(DifferenceFotos*)differenceFotos
         inContext:(NSManagedObjectContext*)context
{
    [Differences createDifference:[NSNumber numberWithInt:topX] topleftY:[NSNumber numberWithInt:topY] downrightX:[NSNumber numberWithInt:downX] downrightY:[NSNumber numberWithInt:downY] centerX:[NSNumber numberWithInt:centerX] centerY:[NSNumber numberWithInt:centerY] differenceFoto:differenceFotos inManagedObjectContext:context];  
}

+(void)populateDatabase:(NSManagedObjectContext *)context
{
    Theme * natureza = [Theme createTheme:@"natureza" foto:@"Nature" inManagedObjectContext:context];
    Theme * comida =[Theme createTheme:@"comida" foto:@"Food" inManagedObjectContext:context];
    Theme * animal =[Theme createTheme:@"animal" foto:@"Animals" inManagedObjectContext:context];
    Theme * desporto =[Theme createTheme:@"desporto" foto:@"Sports" inManagedObjectContext:context];
    Theme * cidade =[Theme createTheme:@"cidade" foto:@"Cities" inManagedObjectContext:context];
    
    
    Difficulty *beginner = [Difficulty createDifficulty:@"beginner" inManagedObjectContext:context];
    /*
    Difficulty *intermediate = [Difficulty createDifficulty:@"intermediate" inManagedObjectContext:context];
    Difficulty *expert = [Difficulty createDifficulty:@"expert" inManagedObjectContext:context];
    */
    Difficulty *detective = [Difficulty createDifficulty:@"detective" inManagedObjectContext:context];
    
    
    Maze *Bridge = [Maze createMaze:@"Bridge" forTheme:cidade inManagedObjectContext:context];
    Bridge.dificulty = beginner;
    DifferenceFotos *BridgeA = [DifferenceFotos createDifferenceFoto:@"BridgeA" forMaze:Bridge inManagedObjectContext:context];
    
    [Seed insertDiffs:71 topY:28 downX:91 downY:48 centerX:81 centerY:38 diffFotos:BridgeA inContext:context];
    [Seed insertDiffs:1.11 topY:35.7 downX:21.11 downY:55.7 centerX:11.11 centerY:45.7 diffFotos:BridgeA inContext:context];
    [Seed insertDiffs:52.82 topY:50.48 downX:72.82 downY:70.48 centerX:62.82 centerY:60.48 diffFotos:BridgeA inContext:context];
    [Seed insertDiffs:25.47 topY:42.23 downX:45.47 downY:62.23 centerX:35.47 centerY:52.23 diffFotos:BridgeA inContext:context];
    [Seed insertDiffs:36.15 topY:32.26 downX:56.15 downY:52.26 centerX:46.15 centerY:42.26 diffFotos:BridgeA inContext:context];
    
    Maze *Castle = [Maze createMaze:@"Castle" forTheme:cidade inManagedObjectContext:context];
    Castle.dificulty = beginner;
    DifferenceFotos *CastleA = [DifferenceFotos createDifferenceFoto:@"CastleA" forMaze:Castle inManagedObjectContext:context];
    
    [Seed insertDiffs:50.25 topY:74.53 downX:70.25 downY:94.53 centerX:60.25 centerY:84.53 diffFotos:CastleA inContext:context];
    [Seed insertDiffs:78.03 topY:64.22 downX:98.03 downY:84.22 centerX:88.03 centerY:74.22 diffFotos:CastleA inContext:context];
    [Seed insertDiffs:46.83 topY:48.76 downX:66.83 downY:68.76 centerX:56.83 centerY:58.76 diffFotos:CastleA inContext:context];
    [Seed insertDiffs:1 topY:36.04 downX:20.68 downY:56.04 centerX:10.68 centerY:46.04 diffFotos:CastleA inContext:context];
    [Seed insertDiffs:67.35 topY:3.40 downX:87.35 downY:23.40 centerX:77.35 centerY:13.40 diffFotos:CastleA inContext:context];
    
    Maze *Cityscape = [Maze createMaze:@"Cityscape" forTheme:cidade inManagedObjectContext:context];
    Cityscape.dificulty = beginner;
    DifferenceFotos *CityscapeA = [DifferenceFotos createDifferenceFoto:@"CityscapeA" forMaze:Cityscape inManagedObjectContext:context];
        
    [Seed insertDiffs:14.78 topY:31.92 downX:34.78 downY:51.92 centerX:24.78 centerY:41.92 diffFotos:CityscapeA inContext:context];
    [Seed insertDiffs:0 topY:31.58 downX:14.27 downY:51.58 centerX:4.27 centerY:41.58 diffFotos:CityscapeA inContext:context];
    [Seed insertDiffs:28.88 topY:68.35 downX:48.88 downY:88.35 centerX:38.88 centerY:78.35 diffFotos:CityscapeA inContext:context];
    [Seed insertDiffs:33.58 topY:75.91 downX:53.58 downY:95.91 centerX:43.58 centerY:85.91 diffFotos:CityscapeA inContext:context];
    [Seed insertDiffs:68.63 topY:52.54 downX:88.63 downY:72.54 centerX:78.63 centerY:62.54 diffFotos:CityscapeA inContext:context];
    
    
    Maze *London_BW = [Maze createMaze:@"London_BW" forTheme:cidade inManagedObjectContext:context];
    London_BW.dificulty = beginner;
    DifferenceFotos *London_BWA = [DifferenceFotos createDifferenceFoto:@"London_BWA" forMaze:London_BW inManagedObjectContext:context];
        
    [Seed insertDiffs:21.19 topY:14.39 downX:41.19 downY:34.39 centerX:31.19 centerY:24.39 diffFotos:London_BWA inContext:context];
    [Seed insertDiffs:13.50 topY:35.36 downX:33.50 downY:55.36 centerX:23.50 centerY:45.36 diffFotos:London_BWA inContext:context];
    [Seed insertDiffs:37.86 topY:51.85 downX:57.86 downY:71.85 centerX:47.86 centerY:61.85 diffFotos:London_BWA inContext:context];
    [Seed insertDiffs:63.5 topY:76.25 downX:83.5 downY:96.25 centerX:73.5 centerY:86.25 diffFotos:London_BWA inContext:context];
    [Seed insertDiffs:75.47 topY:43.95 downX:95.47 downY:63.95 centerX:85.47 centerY:53.95 diffFotos:London_BWA inContext:context];
    
    Maze *Mac_River = [Maze createMaze:@"Mac_River" forTheme:cidade inManagedObjectContext:context];
    Mac_River.dificulty = beginner;
    DifferenceFotos *Mac_RiverA = [DifferenceFotos createDifferenceFoto:@"Mac_RiverA" forMaze:Mac_River inManagedObjectContext:context];
    
    [Seed insertDiffs:0 topY:24.7 downX:18.54 downY:44.7 centerX:8.54 centerY:34.7 diffFotos:Mac_RiverA inContext:context];
    [Seed insertDiffs:67.77 topY:45.67 downX:87.77 downY:65.67 centerX:77.77 centerY:55.67 diffFotos:Mac_RiverA inContext:context];
    [Seed insertDiffs:75.89 topY:33.98 downX:95.89 downY:53.98 centerX:85.89 centerY:43.98 diffFotos:Mac_RiverA inContext:context];
    [Seed insertDiffs:46.41 topY:27.45 downX:66.41 downY:47.45 centerX:56.41 centerY:37.45 diffFotos:Mac_RiverA inContext:context];
    [Seed insertDiffs:69.48 topY:29.86 downX:89.48 downY:49.86 centerX:79.48 centerY:39.86 diffFotos:Mac_RiverA inContext:context];
    
    Maze *Modis_Building = [Maze createMaze:@"Modis_Building" forTheme:cidade inManagedObjectContext:context];
    Modis_Building.dificulty = beginner;
    DifferenceFotos *Modis_BuildingA = [DifferenceFotos createDifferenceFoto:@"Modis_BuildingA" forMaze:Modis_Building inManagedObjectContext:context];
    
    [Seed insertDiffs:1 topY:35.7 downX:20.68 downY:55.7 centerX:10.68 centerY:45.7 diffFotos:Modis_BuildingA inContext:context];
    [Seed insertDiffs:80.17 topY:32.6 downX:100 downY:52.6 centerX:90.17 centerY:42.6 diffFotos:Modis_BuildingA inContext:context];
    [Seed insertDiffs:62.2 topY:38.79 downX:82.2 downY:58.79 centerX:72.2 centerY:48.79 diffFotos:Modis_BuildingA inContext:context];
    [Seed insertDiffs:31.02 topY:14.74 downX:51.02 downY:34.74 centerX:41.02 centerY:24.74 diffFotos:Modis_BuildingA inContext:context];
    [Seed insertDiffs:13.5 topY:31.92 downX:33.5 downY:51.92 centerX:23.5 centerY:41.92 diffFotos:Modis_BuildingA inContext:context];
    
    Maze *Monaco = [Maze createMaze:@"Monaco" forTheme:cidade inManagedObjectContext:context];
    Monaco.dificulty = beginner;
    DifferenceFotos *MonacoA = [DifferenceFotos createDifferenceFoto:@"MonacoA" forMaze:Monaco inManagedObjectContext:context];
    
    [Seed insertDiffs:46.83 topY:22.64 downX:66.83 downY:42.64 centerX:56.83 centerY:32.64 diffFotos:MonacoA inContext:context];
    [Seed insertDiffs:74.18 topY:68.35 downX:94.18 downY:88.35 centerX:84.18 centerY:78.35 diffFotos:MonacoA inContext:context];
    [Seed insertDiffs:42.99 topY:71.44 downX:62.99 downY:91.44 centerX:52.99 centerY:81.44 diffFotos:MonacoA inContext:context];
    [Seed insertDiffs:5.81 topY:67.66 downX:25.81 downY:87.66 centerX:15.81 centerY:77.66 diffFotos:MonacoA inContext:context];
    [Seed insertDiffs:65.21 topY:43.26 downX:85.21 downY:63.26 centerX:75.21 centerY:53.26 diffFotos:MonacoA inContext:context];
    
    Maze *NewYork_Flatiron = [Maze createMaze:@"NewYork_Flatiron" forTheme:cidade inManagedObjectContext:context];
    NewYork_Flatiron.dificulty = beginner;
    DifferenceFotos *NewYork_FlatironA = [DifferenceFotos createDifferenceFoto:@"NewYork_FlatironA" forMaze:NewYork_Flatiron inManagedObjectContext:context];
    
    [Seed insertDiffs:67.35 topY:0 downX:87.35 downY:18.59 centerX:77.35 centerY:8.59 diffFotos:NewYork_FlatironA inContext:context];
    [Seed insertDiffs:57.09 topY:57.01 downX:77.01 downY:77.01 centerX:67.09 centerY:67.01 diffFotos:NewYork_FlatironA inContext:context];
    [Seed insertDiffs:61.36 topY:75.56 downX:81.36 downY:95.56 centerX:71.36 centerY:85.56 diffFotos:NewYork_FlatironA inContext:context];
    [Seed insertDiffs:47.26 topY:73.16 downX:67.26 downY:93.16 centerX:57.26 centerY:83.16 diffFotos:NewYork_FlatironA inContext:context];
    [Seed insertDiffs:40.85 topY:50.82 downX:60.85 downY:70.82 centerX:50.85 centerY:60.82 diffFotos:NewYork_FlatironA inContext:context];
    
    Maze *Night_City = [Maze createMaze:@"Night_City" forTheme:cidade inManagedObjectContext:context];
    Night_City.dificulty = beginner;
    DifferenceFotos *Night_CityA = [DifferenceFotos createDifferenceFoto:@"Night_CityA" forMaze:Night_City inManagedObjectContext:context];
    
    [Seed insertDiffs:24.61 topY:8.55 downX:44.61 downY:28.55 centerX:34.61 centerY:18.55 diffFotos:Night_CityA inContext:context];
    [Seed insertDiffs:78 topY:14.74 downX:98 downY:34.74 centerX:88 centerY:24.74 diffFotos:Night_CityA inContext:context];
    [Seed insertDiffs:59.65 topY:62.85 downX:79.65 downY:82.85 centerX:69.65 centerY:72.85 diffFotos:Night_CityA inContext:context];
    [Seed insertDiffs:48.11 topY:25.39 downX:68.11 downY:45.39 centerX:58.11 centerY:35.39 diffFotos:Night_CityA inContext:context];
    [Seed insertDiffs:43.41 topY:13.71 downX:63.41 downY:33.71 centerX:53.41 centerY:23.71 diffFotos:Night_CityA inContext:context];
    
    Maze *Old_Houses = [Maze createMaze:@"Old_Houses" forTheme:cidade inManagedObjectContext:context];
    Old_Houses.dificulty = beginner;
    DifferenceFotos *Old_HousesA = [DifferenceFotos createDifferenceFoto:@"Old_HousesA" forMaze:Old_Houses inManagedObjectContext:context];
    
    [Seed insertDiffs:43.84 topY:19.55 downX:63.84 downY:39.55 centerX:53.84 centerY:29.55 diffFotos:Old_HousesA inContext:context];
    [Seed insertDiffs:63.07 topY:32.95 downX:83.07 downY:52.95 centerX:73.07 centerY:42.95 diffFotos:Old_HousesA inContext:context];
    [Seed insertDiffs:0 topY:67.31 downX:18.97 downY:87.31 centerX:8.97 centerY:77.31 diffFotos:Old_HousesA inContext:context];
    [Seed insertDiffs:86.58 topY:73.16 downX:100 downY:93.16 centerX:96.58 centerY:83.16 diffFotos:Old_HousesA inContext:context];
    [Seed insertDiffs:66.92 topY:51.16 downX:86.92 downY:71.16 centerX:76.92 centerY:61.16 diffFotos:Old_HousesA inContext:context];
    
    Maze *Small_Street = [Maze createMaze:@"Small_Street" forTheme:cidade inManagedObjectContext:context];
    Small_Street.dificulty = beginner;
    DifferenceFotos *Small_StreetA = [DifferenceFotos createDifferenceFoto:@"Small_StreetA" forMaze:Small_Street inManagedObjectContext:context];

    [Seed insertDiffs:40.85 topY:11.30 downX:60.85 downY:31.30 centerX:50.85 centerY:21.30 diffFotos:Small_StreetA inContext:context];
    [Seed insertDiffs:0 topY:19.89 downX:17.26 downY:39.89 centerX:7.26 centerY:29.89 diffFotos:Small_StreetA inContext:context];
    [Seed insertDiffs:72.90 topY:75.9 downX:92.9 downY:95.9 centerX:82.9 centerY:85.9 diffFotos:Small_StreetA inContext:context];
    [Seed insertDiffs:51.11 topY:79 downX:71.11 downY:99 centerX:61.11 centerY:89 diffFotos:Small_StreetA inContext:context];
    [Seed insertDiffs:43.41 topY:53.23 downX:63.41 downY:73.23 centerX:53.41 centerY:63.23 diffFotos:Small_StreetA inContext:context];
    
    Maze *Sunset_Crane = [Maze createMaze:@"Sunset_Crane" forTheme:cidade inManagedObjectContext:context];
    Sunset_Crane.dificulty = beginner;
    DifferenceFotos *Sunset_CraneA = [DifferenceFotos createDifferenceFoto:@"Sunset_CraneA" forMaze:Sunset_Crane inManagedObjectContext:context];

    
    [Seed insertDiffs:4.10 topY:47.73 downX:24.10 downY:67.73 centerX:14.10 centerY:57.73 diffFotos:Sunset_CraneA inContext:context];
    [Seed insertDiffs:25.47 topY:35.01 downX:45.47 downY:55.01 centerX:35.47 centerY:45.01 diffFotos:Sunset_CraneA inContext:context];
    [Seed insertDiffs:54.10 topY:46 downX:74.1 downY:66 centerX:64.1 centerY:56 diffFotos:Sunset_CraneA inContext:context];
    [Seed insertDiffs:78.46 topY:47.38 downX:98.46 downY:67.38 centerX:88.46 centerY:57.38 diffFotos:Sunset_CraneA inContext:context];
    [Seed insertDiffs:61.36 topY:34.32 downX:81.36 downY:54.32 centerX:71.36 centerY:44.32 diffFotos:Sunset_CraneA inContext:context];
    
    Maze *Desporto01 = [Maze createMaze:@"Desporto01" forTheme:desporto inManagedObjectContext:context];
    Desporto01.dificulty = beginner;
    DifferenceFotos *Desporto01A = [DifferenceFotos createDifferenceFoto:@"Desporto01A" forMaze:Desporto01 inManagedObjectContext:context];
    
    [Seed insertDiffs:3.7 topY:44.55 downX:23.7 downY:64.55 centerX:13.7 centerY:54.55 diffFotos:Desporto01A inContext:context];
    [Seed insertDiffs:23.8 topY:29.05 downX:43.8 downY:49.05 centerX:33.8 centerY:39.05 diffFotos:Desporto01A inContext:context];
    [Seed insertDiffs:43 topY:63.45 downX:63 downY:83.45 centerX:53 centerY:73.45 diffFotos:Desporto01A inContext:context];
    [Seed insertDiffs:52.8 topY:51.45 downX:72.8 downY:71.45 centerX:62.8 centerY:61.45 diffFotos:Desporto01A inContext:context];
    [Seed insertDiffs:30 topY:5 downX:50 downY:24 centerX:40 centerY:14.75 diffFotos:Desporto01A inContext:context];

    
    Maze *Desporto02 = [Maze createMaze:@"Desporto02" forTheme:desporto inManagedObjectContext:context];
    Desporto02.dificulty = beginner;
    DifferenceFotos *Desporto02A = [DifferenceFotos createDifferenceFoto:@"Desporto02A" forMaze:Desporto02 inManagedObjectContext:context];
    
    [Seed insertDiffs:57.9 topY:15.35 downX:77.9 downY:35.35 centerX:67.9 centerY:25.35 diffFotos:Desporto02A inContext:context];
    [Seed insertDiffs:44.7 topY:66.75 downX:64.7 downY:86.75 centerX:54.7 centerY:76.75 diffFotos:Desporto02A inContext:context];
    [Seed insertDiffs:27.6 topY:23.25 downX:47.6 downY:43 centerX:37.6 centerY:33.25 diffFotos:Desporto02A inContext:context];
    [Seed insertDiffs:70.3 topY:78.75 downX:90.3 downY:98 centerX:80.3 centerY:88.75 diffFotos:Desporto02A inContext:context];
    [Seed insertDiffs:17 topY:43.75 downX:37 downY:63.75 centerX:27 centerY:53.75 diffFotos:Desporto02A inContext:context];

    
    Maze *Desporto03 = [Maze createMaze:@"Desporto03" forTheme:desporto inManagedObjectContext:context];
    Desporto03.dificulty = beginner;
    DifferenceFotos *Desporto03A = [DifferenceFotos createDifferenceFoto:@"Desporto03A" forMaze:Desporto03 inManagedObjectContext:context];
   
    [Seed insertDiffs:74 topY:30.5 downX:94 downY:50.5 centerX:84 centerY:36.25 diffFotos:Desporto03A inContext:context];
    [Seed insertDiffs:52.8 topY:38.8 downX:72.8 downY:58.8 centerX:62.8 centerY:44.55 diffFotos:Desporto03A inContext:context];
    [Seed insertDiffs:69 topY:85 downX:89 downY:100 centerX:79 centerY:90.75 diffFotos:Desporto03A inContext:context];
    [Seed insertDiffs:19 topY:24 downX:39 downY:44 centerX:29 centerY:29.75 diffFotos:Desporto03A inContext:context];
    [Seed insertDiffs:78 topY:21.6 downX:98 downY:41.6 centerX:88 centerY:27.35 diffFotos:Desporto03A inContext:context];

    
    Maze *Desporto04 = [Maze createMaze:@"Desporto04" forTheme:desporto inManagedObjectContext:context];
    Desporto04.dificulty = beginner;
    DifferenceFotos *Desporto04A = [DifferenceFotos createDifferenceFoto:@"Desporto04A" forMaze:Desporto04 inManagedObjectContext:context];
    
    [Seed insertDiffs:24 topY:82 downX:44 downY:100 centerX:34 centerY:87.75 diffFotos:Desporto04A inContext:context];
    [Seed insertDiffs:69.9 topY:16.8 downX:89.9 downY:36.8 centerX:79.9 centerY:22.55 diffFotos:Desporto04A inContext:context];
    [Seed insertDiffs:49 topY:19.9 downX:69 downY:38.9 centerX:59 centerY:24.65 diffFotos:Desporto04A inContext:context];
    [Seed insertDiffs:1 topY:13 downX:20 downY:33 centerX:10.3 centerY:18.75 diffFotos:Desporto04A inContext:context];
    [Seed insertDiffs:35 topY:16 downX:53 downY:35.8 centerX:43 centerY:21.55 diffFotos:Desporto04A inContext:context];

    
    Maze *Desporto05 = [Maze createMaze:@"Desporto05" forTheme:desporto inManagedObjectContext:context];
    Desporto05.dificulty = beginner;
    DifferenceFotos *Desporto05A = [DifferenceFotos createDifferenceFoto:@"Desporto05A" forMaze:Desporto05 inManagedObjectContext:context];

    [Seed insertDiffs:1 topY:43 downX:19.8 downY:63 centerX:9.8 centerY:48.75 diffFotos:Desporto05A inContext:context];
    [Seed insertDiffs:3 topY:13 downX:22 downY:32 centerX:12.4 centerY:18.03 diffFotos:Desporto05A inContext:context];
    [Seed insertDiffs:78 topY:49 downX:98 downY:68 centerX:88 centerY:54.15 diffFotos:Desporto05A inContext:context];
    [Seed insertDiffs:2 topY:89 downX:21 downY:100 centerX:11.1 centerY:95.05 diffFotos:Desporto05A inContext:context];
    [Seed insertDiffs:67 topY:82 downX:86 downY:99 centerX:76.5 centerY:87.75 diffFotos:Desporto05A inContext:context];

    
    Maze *Desporto06 = [Maze createMaze:@"Desporto06" forTheme:desporto inManagedObjectContext:context];
    Desporto06.dificulty = beginner;
    DifferenceFotos *Desporto06A = [DifferenceFotos createDifferenceFoto:@"Desporto06A" forMaze:Desporto06 inManagedObjectContext:context];
  
    [Seed insertDiffs:68 topY:82 downX:87 downY:99 centerX:77.3 centerY:87.15 diffFotos:Desporto06A inContext:context];
    [Seed insertDiffs:63 topY:30 downX:80 downY:49 centerX:72.6 centerY:35.61 diffFotos:Desporto06A inContext:context];
    [Seed insertDiffs:3 topY:1 downX:22.4 downY:17.56 centerX:12.4 centerY:3.31 diffFotos:Desporto06A inContext:context];
    [Seed insertDiffs:16.5 topY:78.65 downX:36.5 downY:98.65 centerX:26.5 centerY:84.4 diffFotos:Desporto06A inContext:context];
    [Seed insertDiffs:48.5 topY:49.8 downX:68.5 downY:69.8 centerX:58.5 centerY:55.55 diffFotos:Desporto06A inContext:context];

    
    Maze *Desporto07 = [Maze createMaze:@"Desporto07" forTheme:desporto inManagedObjectContext:context];
    Desporto07.dificulty = beginner;
    DifferenceFotos *Desporto07A = [DifferenceFotos createDifferenceFoto:@"Desporto07A" forMaze:Desporto07 inManagedObjectContext:context];
 
    [Seed insertDiffs:56.2 topY:36 downX:76 downY:56 centerX:66.2 centerY:41.75 diffFotos:Desporto07A inContext:context];
    [Seed insertDiffs:34 topY:33.64 downX:54 downY:53 centerX:44 centerY:39.39 diffFotos:Desporto07A inContext:context];
    [Seed insertDiffs:20 topY:50 downX:39 downY:69 centerX:29.9 centerY:55.55 diffFotos:Desporto07A inContext:context];
    [Seed insertDiffs:33 topY:6 downX:50 downY:23 centerX:42.3 centerY:10.87 diffFotos:Desporto07A inContext:context];
    [Seed insertDiffs:72 topY:42 downX:92 downY:62 centerX:82 centerY:47.75 diffFotos:Desporto07A inContext:context];

    
    Maze *Desporto08 = [Maze createMaze:@"Desporto08" forTheme:desporto inManagedObjectContext:context];
    Desporto08.dificulty = beginner;
    DifferenceFotos *Desporto08A = [DifferenceFotos createDifferenceFoto:@"Desporto08A" forMaze:Desporto08 inManagedObjectContext:context];
    
    [Seed insertDiffs:56 topY:3 downX:76 downY:22 centerX:66 centerY:7.75 diffFotos:Desporto08A inContext:context];
    [Seed insertDiffs:62 topY:49 downX:82 downY:68 centerX:72 centerY:54.51 diffFotos:Desporto08A inContext:context];
    [Seed insertDiffs:58 topY:62 downX:78 downY:81 centerX:68 centerY:67.55 diffFotos:Desporto08A inContext:context];
    [Seed insertDiffs:42 topY:74 downX:62 downY:91 centerX:52 centerY:79.25 diffFotos:Desporto08A inContext:context];
    [Seed insertDiffs:24.6 topY:46 downX:44.6 downY:66 centerX:34.6 centerY:51.75 diffFotos:Desporto08A inContext:context];

    
    Maze *Desporto09 = [Maze createMaze:@"Desporto09" forTheme:desporto inManagedObjectContext:context];
    Desporto09.dificulty = beginner;
    DifferenceFotos *Desporto09A = [DifferenceFotos createDifferenceFoto:@"Desporto09A" forMaze:Desporto09 inManagedObjectContext:context];
    
    [Seed insertDiffs:57 topY:47 downX:76 downY:67 centerX:66.6 centerY:52.75 diffFotos:Desporto09A inContext:context];
    [Seed insertDiffs:44 topY:37 downX:64 downY:57 centerX:54 centerY:42.75 diffFotos:Desporto09A inContext:context];
    [Seed insertDiffs:23 topY:43 downX:42 downY:62 centerX:32.5 centerY:48.32 diffFotos:Desporto09A inContext:context];
    [Seed insertDiffs:38 topY:57 downX:57 downY:76 centerX:47.86 centerY:62.05 diffFotos:Desporto09A inContext:context];
    [Seed insertDiffs:4 topY:43 downX:23 downY:62 centerX:13.24 centerY:47.98 diffFotos:Desporto09A inContext:context];


    Maze *Desporto10 = [Maze createMaze:@"Desporto10" forTheme:desporto inManagedObjectContext:context];
    Desporto10.dificulty = beginner;
    DifferenceFotos *Desporto10A = [DifferenceFotos createDifferenceFoto:@"Desporto10A" forMaze:Desporto10 inManagedObjectContext:context];
    
    [Seed insertDiffs:66 topY:82 downX:85 downY:99 centerX:76 centerY:86.75 diffFotos:Desporto10A inContext:context];
    [Seed insertDiffs:52 topY:22 downX:69 downY:40 centerX:60.25 centerY:27.36 diffFotos:Desporto10A inContext:context];
    [Seed insertDiffs:20 topY:63 downX:39 downY:82 centerX:29.9 centerY:68.6 diffFotos:Desporto10A inContext:context];
    [Seed insertDiffs:10 topY:32 downX:29 downY:51 centerX:19.23 centerY:36.98 diffFotos:Desporto10A inContext:context];
    [Seed insertDiffs:82 topY:18 downX:99 downY:37 centerX:91.88 centerY:23.24 diffFotos:Desporto10A inContext:context];
    
    Maze *Desporto11 = [Maze createMaze:@"Desporto11" forTheme:desporto inManagedObjectContext:context];
    Desporto11.dificulty = beginner;
    DifferenceFotos *Desporto11A = [DifferenceFotos createDifferenceFoto:@"Desporto11A" forMaze:Desporto11 inManagedObjectContext:context];
    
    [Seed insertDiffs:10 topY:26 downX:29 downY:45 centerX:19.23 centerY:30.75 diffFotos:Desporto11A inContext:context];
    [Seed insertDiffs:40 topY:38 downX:59 downY:57 centerX:49.57 centerY:43.15 diffFotos:Desporto11A inContext:context];
    [Seed insertDiffs:55 topY:71 downX:74 downY:90 centerX:64.95 centerY:76.75 diffFotos:Desporto11A inContext:context];
    [Seed insertDiffs:17 topY:75 downX:36 downY:94 centerX:26.49 centerY:80.28 diffFotos:Desporto11A inContext:context];
    [Seed insertDiffs:7 topY:38 downX:26 downY:57 centerX:16.66 centerY:43.17 diffFotos:Desporto11A inContext:context];
    
    Maze *Desporto12 = [Maze createMaze:@"Desporto12" forTheme:desporto inManagedObjectContext:context];
    Desporto12.dificulty = beginner;
    DifferenceFotos *Desporto12A = [DifferenceFotos createDifferenceFoto:@"Desporto12A" forMaze:Desporto12 inManagedObjectContext:context];
    
    [Seed insertDiffs:57 topY:70 downX:76 downY:88 centerX:66.6 centerY:74.75 diffFotos:Desporto12A inContext:context];
    [Seed insertDiffs:4 topY:60 downX:23 downY:78 centerX:13.67 centerY:64.45 diffFotos:Desporto12A inContext:context];
    [Seed insertDiffs:31 topY:58 downX:50 downY:77 centerX:40.6 centerY:63.1 diffFotos:Desporto12A inContext:context];
    [Seed insertDiffs:55 topY:51 downX:74 downY:70 centerX:64.1 centerY:56.55 diffFotos:Desporto12A inContext:context];
    [Seed insertDiffs:80 topY:45 downX:99 downY:64 centerX:90 centerY:50.04 diffFotos:Desporto12A inContext:context];
    
    Maze *Natureza01 = [Maze createMaze:@"Natureza01" forTheme:natureza inManagedObjectContext:context];
    Natureza01.dificulty = beginner;
    DifferenceFotos *Natureza01A = [DifferenceFotos createDifferenceFoto:@"Natureza01A" forMaze:Natureza01 inManagedObjectContext:context];
    
    [Seed insertDiffs:27 topY:76 downX:46 downY:95 centerX:36.32 centerY:81.9 diffFotos:Natureza01A inContext:context];
    [Seed insertDiffs:70 topY:81 downX:89 downY:99 centerX:79.91 centerY:86.37 diffFotos:Natureza01A inContext:context];
    [Seed insertDiffs:35 topY:60 downX:54 downY:80 centerX:44.87 centerY:66 diffFotos:Natureza01A inContext:context];
    [Seed insertDiffs:68 topY:57 downX:87 downY:76 centerX:77.35 centerY:62.6 diffFotos:Natureza01A inContext:context];
    [Seed insertDiffs:13 topY:20 downX:32 downY:39 centerX:22.65 centerY:25.2 diffFotos:Natureza01A inContext:context];
    
    Maze *Natureza02 = [Maze createMaze:@"Natureza02" forTheme:natureza inManagedObjectContext:context];
    Natureza02.dificulty = beginner;
    DifferenceFotos *Natureza02A = [DifferenceFotos createDifferenceFoto:@"Natureza02A" forMaze:Natureza02 inManagedObjectContext:context];
        
    [Seed insertDiffs:60 topY:83 downX:79 downY:99 centerX:69.66 centerY:88.78 diffFotos:Natureza02A inContext:context];
    [Seed insertDiffs:29 topY:36 downX:48 downY:55 centerX:38.46 centerY:41.36 diffFotos:Natureza02A inContext:context];
    [Seed insertDiffs:49 topY:24 downX:68 downY:43 centerX:58.97 centerY:29.67 diffFotos:Natureza02A inContext:context];
    [Seed insertDiffs:74 topY:13 downX:93 downY:32 centerX:83.76 centerY:18.33 diffFotos:Natureza02A inContext:context];
    [Seed insertDiffs:49 topY:2 downX:68 downY:21 centerX:58.54 centerY:7.68 diffFotos:Natureza02A inContext:context];
    
    Maze *Natureza03 = [Maze createMaze:@"Natureza03" forTheme:natureza inManagedObjectContext:context];
    Natureza03.dificulty = beginner;
    DifferenceFotos *Natureza03A = [DifferenceFotos createDifferenceFoto:@"Natureza03A" forMaze:Natureza03 inManagedObjectContext:context];
        
    [Seed insertDiffs:29 topY:60 downX:48 downY:79 centerX:38.88 centerY:65.76 diffFotos:Natureza03A inContext:context];
    [Seed insertDiffs:54 topY:49 downX:73 downY:68 centerX:63.67 centerY:54.4 diffFotos:Natureza03A inContext:context];
    [Seed insertDiffs:54 topY:38 downX:73 downY:56 centerX:63.67 centerY:43.07 diffFotos:Natureza03A inContext:context];
    [Seed insertDiffs:42 topY:29 downX:61 downY:48 centerX:51.28 centerY:34.83 diffFotos:Natureza03A inContext:context];
    [Seed insertDiffs:11 topY:12 downX:30 downY:30 centerX:20.5 centerY:17.3 diffFotos:Natureza03A inContext:context];
    
    Maze *Natureza04 = [Maze createMaze:@"Natureza04" forTheme:natureza inManagedObjectContext:context];
    Natureza04.dificulty = beginner;
    DifferenceFotos *Natureza04A = [DifferenceFotos createDifferenceFoto:@"Natureza04A" forMaze:Natureza04 inManagedObjectContext:context];
        
    [Seed insertDiffs:10 topY:77 downX:29 downY:96 centerX:19.23 centerY:82.59 diffFotos:Natureza04A inContext:context];
    [Seed insertDiffs:44 topY:75 downX:61 downY:93 centerX:52.99 centerY:80.2 diffFotos:Natureza04A inContext:context];
    [Seed insertDiffs:64 topY:55 downX:82 downY:73 centerX:73.5 centerY:60.3 diffFotos:Natureza04A inContext:context];
    [Seed insertDiffs:75 topY:23 downX:93 downY:41 centerX:84.18 centerY:28.64 diffFotos:Natureza04A inContext:context];
    [Seed insertDiffs:6 topY:33 downX:24 downY:51 centerX:15.38 centerY:38.6 diffFotos:Natureza04A inContext:context];
    
    Maze *Natureza05 = [Maze createMaze:@"Natureza05" forTheme:natureza inManagedObjectContext:context];
    Natureza05.dificulty = beginner;
    DifferenceFotos *Natureza05A = [DifferenceFotos createDifferenceFoto:@"Natureza05A" forMaze:Natureza05 inManagedObjectContext:context];
        
    [Seed insertDiffs:48 topY:75 downX:67 downY:93 centerX:57.26 centerY:80.53 diffFotos:Natureza05A inContext:context];
    [Seed insertDiffs:27 topY:62 downX:46 downY:81 centerX:36.75 centerY:67.47 diffFotos:Natureza05A inContext:context];
    [Seed insertDiffs:21 topY:35 downX:39 downY:53 centerX:30.76 centerY:40.33 diffFotos:Natureza05A inContext:context];
    [Seed insertDiffs:28 topY:27 downX:46 downY:45 centerX:37.17 centerY:32.08 diffFotos:Natureza05A inContext:context];
    [Seed insertDiffs:2 topY:16 downX:20 downY:34 centerX:10.68 centerY:21.08 diffFotos:Natureza05A inContext:context];
    
    Maze *Natureza06 = [Maze createMaze:@"Natureza06" forTheme:natureza inManagedObjectContext:context];
    Natureza06.dificulty = beginner;
    DifferenceFotos *Natureza06A = [DifferenceFotos createDifferenceFoto:@"Natureza06A" forMaze:Natureza06 inManagedObjectContext:context];
    
    [Seed insertDiffs:18 topY:89 downX:36 downY:100 centerX:27.35 centerY:94.62 diffFotos:Natureza06A inContext:context];
    [Seed insertDiffs:18 topY:58 downX:36 downY:76 centerX:27.35 centerY:63.35 diffFotos:Natureza06A inContext:context];
    [Seed insertDiffs:67 topY:18 downX:86 downY:37 centerX:76.49 centerY:23.14 diffFotos:Natureza06A inContext:context];
    [Seed insertDiffs:72 topY:25 downX:92 downY:44 centerX:82 centerY:30.7 diffFotos:Natureza06A inContext:context];
    [Seed insertDiffs:20 topY:23 downX:39 downY:41 centerX:29.9 centerY:28.64 diffFotos:Natureza06A inContext:context];
    
    Maze *Natureza07 = [Maze createMaze:@"Natureza07" forTheme:natureza inManagedObjectContext:context];
    Natureza07.dificulty = beginner;
    DifferenceFotos *Natureza07A = [DifferenceFotos createDifferenceFoto:@"Natureza07A" forMaze:Natureza07 inManagedObjectContext:context];
    
    [Seed insertDiffs:38 topY:68 downX:57 downY:87 centerX:47.86 centerY:73.3 diffFotos:Natureza07A inContext:context];
    [Seed insertDiffs:6 topY:56 downX:25 downY:75 centerX:15.8 centerY:61.97 diffFotos:Natureza07A inContext:context];
    [Seed insertDiffs:62 topY:52 downX:80 downY:71 centerX:71.36 centerY:57.82 diffFotos:Natureza07A inContext:context];
    [Seed insertDiffs:72 topY:43 downX:91 downY:62 centerX:81.19 centerY:48.92 diffFotos:Natureza07A inContext:context];
    [Seed insertDiffs:71 topY:29 downX:89 downY:48 centerX:80.34 centerY:34.14 diffFotos:Natureza07A inContext:context];
    
    Maze *Natureza08 = [Maze createMaze:@"Natureza08" forTheme:natureza inManagedObjectContext:context];
    Natureza08.dificulty = beginner;
    DifferenceFotos *Natureza08A = [DifferenceFotos createDifferenceFoto:@"Natureza08A" forMaze:Natureza08 inManagedObjectContext:context];
    
    [Seed insertDiffs:25 topY:87 downX:44 downY:100 centerX:34.61 centerY:93 diffFotos:Natureza08A inContext:context];
    [Seed insertDiffs:44 topY:66 downX:63 downY:85 centerX:53.84 centerY:71.94 diffFotos:Natureza08A inContext:context];
    [Seed insertDiffs:63 topY:44 downX:83 downY:63 centerX:73.07 centerY:49.95 diffFotos:Natureza08A inContext:context];
    [Seed insertDiffs:43 topY:28 downX:62 downY:47 centerX:52.13 centerY:33.11 diffFotos:Natureza08A inContext:context];
    [Seed insertDiffs:19 topY:19 downX:38 downY:38 centerX:28.2 centerY:24.86 diffFotos:Natureza08A inContext:context];
    
    Maze *Natureza09 = [Maze createMaze:@"Natureza09" forTheme:natureza inManagedObjectContext:context];
    Natureza09.dificulty = beginner;
    DifferenceFotos *Natureza09A = [DifferenceFotos createDifferenceFoto:@"Natureza09A" forMaze:Natureza09 inManagedObjectContext:context];
    
    [Seed insertDiffs:67 topY:84 downX:86 downY:100 centerX:76.49 centerY:90.15 diffFotos:Natureza09A inContext:context];
    [Seed insertDiffs:33 topY:69 downX:52 downY:89 centerX:42.30 centerY:75 diffFotos:Natureza09A inContext:context];
    [Seed insertDiffs:41 topY:44 downX:60 downY:63 centerX:50.85 centerY:49.95 diffFotos:Natureza09A inContext:context];
    [Seed insertDiffs:23 topY:26 downX:42 downY:45 centerX:32.9 centerY:31.7 diffFotos:Natureza09A inContext:context];
    [Seed insertDiffs:4 topY:33 downX:23 downY:52 centerX:13.67 centerY:38.26 diffFotos:Natureza09A inContext:context];
    
    Maze *Natureza10 = [Maze createMaze:@"Natureza10" forTheme:natureza inManagedObjectContext:context];
    Natureza10.dificulty = beginner;
    DifferenceFotos *Natureza10A = [DifferenceFotos createDifferenceFoto:@"Natureza10A" forMaze:Natureza10 inManagedObjectContext:context];
    
    [Seed insertDiffs:15 topY:67 downX:34 downY:86 centerX:24.78 centerY:72.63 diffFotos:Natureza10A inContext:context];
    [Seed insertDiffs:36 topY:62 downX:56 downY:81 centerX:46 centerY:67.47 diffFotos:Natureza10A inContext:context];
    [Seed insertDiffs:70 topY:85 downX:89 downY:100 centerX:79.48 centerY:90.5 diffFotos:Natureza10A inContext:context];
    [Seed insertDiffs:67 topY:52 downX:86 downY:71 centerX:76.9 centerY:57.16 diffFotos:Natureza10A inContext:context];
    [Seed insertDiffs:78 topY:20 downX:97 downY:39 centerX:87.17 centerY:25.89 diffFotos:Natureza10A inContext:context];
    
    Maze *Natureza11 = [Maze createMaze:@"Natureza11" forTheme:natureza inManagedObjectContext:context];
    Natureza11.dificulty = beginner;
    DifferenceFotos *Natureza11A = [DifferenceFotos createDifferenceFoto:@"Natureza11A" forMaze:Natureza11 inManagedObjectContext:context];
    
    [Seed insertDiffs:35 topY:63 downX:54 downY:82 centerX:44.4 centerY:68.5 diffFotos:Natureza11A inContext:context];
    [Seed insertDiffs:50 topY:70 downX:69 downY:90 centerX:59.82 centerY:76 diffFotos:Natureza11A inContext:context];
    [Seed insertDiffs:48 topY:55 downX:67 downY:74 centerX:57.26 centerY:60.6 diffFotos:Natureza11A inContext:context];
    [Seed insertDiffs:17 topY:55 downX:36 downY:74 centerX:26.49 centerY:60.94 diffFotos:Natureza11A inContext:context];
    [Seed insertDiffs:57 topY:59 downX:76 downY:78 centerX:66.23 centerY:64.38 diffFotos:Natureza11A inContext:context];
    
    Maze *Natureza12 = [Maze createMaze:@"Natureza12" forTheme:natureza inManagedObjectContext:context];
    Natureza12.dificulty = beginner;
    DifferenceFotos *Natureza12A = [DifferenceFotos createDifferenceFoto:@"Natureza12A" forMaze:Natureza12 inManagedObjectContext:context];
    
    [Seed insertDiffs:20 topY:58 downX:39 downY:77 centerX:29.9 centerY:63.35 diffFotos:Natureza12A inContext:context];
    [Seed insertDiffs:35 topY:34 downX:54 downY:53 centerX:44.4 centerY:39.98 diffFotos:Natureza12A inContext:context];
    [Seed insertDiffs:25 topY:42 downX:44 downY:62 centerX:34.18 centerY:47.20 diffFotos:Natureza12A inContext:context];
    [Seed insertDiffs:68 topY:53 downX:87 downY:72 centerX:77.7 centerY:58.88 diffFotos:Natureza12A inContext:context];
    [Seed insertDiffs:41 topY:48 downX:60 downY:68 centerX:50.85 centerY:54.07 diffFotos:Natureza12A inContext:context];
    
    Maze *Bird_Cage = [Maze createMaze:@"Bird_Cage" forTheme:animal inManagedObjectContext:context];
    Bird_Cage.dificulty = detective;
    DifferenceFotos *Bird_CageA = [DifferenceFotos createDifferenceFoto:@"Bird_CageA" forMaze:Bird_Cage inManagedObjectContext:context];
    
    [Seed insertDiffs:53.4 topY:0 downX:64.9 downY:9.2 centerX:72 centerY:31.6 diffFotos:Bird_CageA inContext:context];
    [Seed insertDiffs:19.2 topY:24.4 downX:28.2 downY:31.4 centerX:60 centerY:3.4 diffFotos:Bird_CageA inContext:context];
    [Seed insertDiffs:68.3 topY:29.6 downX:74.7 downY:32.6 centerX:34.2 centerY:64 diffFotos:Bird_CageA inContext:context];
    [Seed insertDiffs:37.6 topY:45.5 downX:45.7 downY:51.5 centerX:22.2 centerY:28.5 diffFotos:Bird_CageA inContext:context];
    [Seed insertDiffs:48.8 topY:59 downX:56.9 downY:68.5 centerX:40.17 centerY:49.48 diffFotos:Bird_CageA inContext:context];
    
    Maze *Dragonfish = [Maze createMaze:@"Dragonfish" forTheme:animal inManagedObjectContext:context];
    Dragonfish.dificulty = beginner;
    DifferenceFotos *DragonfishA = [DifferenceFotos createDifferenceFoto:@"DragonfishA" forMaze:Dragonfish inManagedObjectContext:context];
    
    [Seed insertDiffs:67 topY:0 downX:86 downY:17 centerX:76.92 centerY:7.2 diffFotos:DragonfishA inContext:context];
    [Seed insertDiffs:30 topY:55 downX:49 downY:74 centerX:39.7 centerY:64.26 diffFotos:DragonfishA inContext:context];
    [Seed insertDiffs:20 topY:86 downX:39 downY:100 centerX:29.9 centerY:95.53 diffFotos:DragonfishA inContext:context];
    [Seed insertDiffs:62 topY:38 downX:81 downY:57 centerX:71.36 centerY:47.4 diffFotos:DragonfishA inContext:context];
    [Seed insertDiffs:17 topY:35 downX:36.5 downY:54 centerX:26.49 centerY:44.67 diffFotos:DragonfishA inContext:context];
    
    
    Maze *Elephant = [Maze createMaze:@"Elephant" forTheme:animal inManagedObjectContext:context];
    Elephant.dificulty = beginner;
    DifferenceFotos *ElephantA = [DifferenceFotos createDifferenceFoto:@"ElephantA" forMaze:Elephant inManagedObjectContext:context];
       
    [Seed insertDiffs:2 topY:18 downX:21 downY:37 centerX:11.96 centerY:27.49 diffFotos:ElephantA inContext:context];
    [Seed insertDiffs:84 topY:30 downX:100 downY:50 centerX:94 centerY:40.2 diffFotos:ElephantA inContext:context];
    [Seed insertDiffs:57 topY:49 downX:77 downY:68 centerX:67 centerY:58.4 diffFotos:ElephantA inContext:context];
    [Seed insertDiffs:64 topY:86 downX:83 downY:100 centerX:73.5 centerY:95.18 diffFotos:ElephantA inContext:context];
    [Seed insertDiffs:18 topY:55 downX:37 downY:74 centerX:27.7 centerY:64.6 diffFotos:ElephantA inContext:context];
    
    Maze *Fishes = [Maze createMaze:@"Fishes" forTheme:animal inManagedObjectContext:context];
    Fishes.dificulty = beginner;
    DifferenceFotos *FishesA = [DifferenceFotos createDifferenceFoto:@"FishesA" forMaze:Fishes inManagedObjectContext:context];
    
    [Seed insertDiffs:10 topY:0 downX:29 downY:19 centerX:19.65 centerY:9.27 diffFotos:FishesA inContext:context];
    [Seed insertDiffs:37 topY:19 downX:56 downY:38 centerX:46.58 centerY:28.8 diffFotos:FishesA inContext:context];
    [Seed insertDiffs:68 topY:80 downX:88 downY:100 centerX:78.2 centerY:90 diffFotos:FishesA inContext:context];
    [Seed insertDiffs:23 topY:52 downX:42 downY:71 centerX:32.47 centerY:61.5 diffFotos:FishesA inContext:context];
    [Seed insertDiffs:49 topY:58 downX:68 downY:78 centerX:58.97 centerY:68.04 diffFotos:FishesA inContext:context];
    
    Maze *Leopard = [Maze createMaze:@"Leopard" forTheme:animal inManagedObjectContext:context];
    Leopard.dificulty = beginner;
    DifferenceFotos *LeopardA = [DifferenceFotos createDifferenceFoto:@"LeopardA" forMaze:Leopard inManagedObjectContext:context];
    
    [Seed insertDiffs:35 topY:6.15 downX:54.8 downY:26.15 centerX:44.8 centerY:16.15 diffFotos:LeopardA inContext:context];
    [Seed insertDiffs:29.7 topY:24.02 downX:49.7 downY:44.02 centerX:39.7 centerY:34.02 diffFotos:LeopardA inContext:context];
    [Seed insertDiffs:26.3 topY:39.82 downX:46.3 downY:59.82 centerX:36.3 centerY:49.82 diffFotos:LeopardA inContext:context];
    [Seed insertDiffs:76.75 topY:70.06 downX:96.75 downY:90 centerX:86.75 centerY:80 diffFotos:LeopardA inContext:context];
    [Seed insertDiffs:9.23 topY:66.28 downX:29.23 downY:86.28 centerX:19.23 centerY:76.28 diffFotos:LeopardA inContext:context];
    
    Maze *Lion = [Maze createMaze:@"Lion" forTheme:animal inManagedObjectContext:context];
    Lion.dificulty = beginner;
    DifferenceFotos *LionA = [DifferenceFotos createDifferenceFoto:@"LionA" forMaze:Lion inManagedObjectContext:context];
    
    [Seed insertDiffs:39.14 topY:3.4 downX:59.14 downY:23.4 centerX:49.14 centerY:13.4 diffFotos:LionA inContext:context];
    [Seed insertDiffs:27.17 topY:11.3 downX:47.17 downY:31.3 centerX:37.17 centerY:21.3 diffFotos:LionA inContext:context];
    [Seed insertDiffs:53.67 topY:55.63 downX:73.67 downY:75.63 centerX:63.67 centerY:65.63 diffFotos:LionA inContext:context];
    [Seed insertDiffs:77.6 topY:56.32 downX:97.6 downY:76.32 centerX:87.6 centerY:66.32 diffFotos:LionA inContext:context];
    [Seed insertDiffs:54.95 topY:61.82 downX:74.95 downY:81.82 centerX:64.95 centerY:71.82 diffFotos:LionA inContext:context];
    
    Maze *Monkey = [Maze createMaze:@"Monkey" forTheme:animal inManagedObjectContext:context];
    Monkey.dificulty = beginner;
    DifferenceFotos *MonkeyA = [DifferenceFotos createDifferenceFoto:@"MonkeyA" forMaze:Monkey inManagedObjectContext:context];
    
    [Seed insertDiffs:10.94 topY:83.1 downX:30.94 downY:100 centerX:20.94 centerY:93.1 diffFotos:MonkeyA inContext:context];
    [Seed insertDiffs:56.23 topY:24.02 downX:76.23 downY:44 centerX:66.23 centerY:34.02 diffFotos:MonkeyA inContext:context];
    [Seed insertDiffs:34.4 topY:15.77 downX:54.44 downY:35 centerX:44.4 centerY:25.77 diffFotos:MonkeyA inContext:context];
    [Seed insertDiffs:34 topY:26 downX:54 downY:45 centerX:44 centerY:35.39 diffFotos:MonkeyA inContext:context];
    [Seed insertDiffs:79 topY:28 downX:98 downY:47 centerX:88.88 centerY:37.45 diffFotos:MonkeyA inContext:context];

    
    Maze *Pidgeons = [Maze createMaze:@"Pidgeons" forTheme:animal inManagedObjectContext:context];
    Pidgeons.dificulty = beginner;
    DifferenceFotos *PidgeonsA = [DifferenceFotos createDifferenceFoto:@"PidgeonsA" forMaze:Pidgeons inManagedObjectContext:context];
    
    [Seed insertDiffs:0 topY:30.54 downX:15.55 downY:50 centerX:5.55 centerY:40.54 diffFotos:PidgeonsA inContext:context];
    [Seed insertDiffs:19.91 topY:76.25 downX:39.91 downY:96.25 centerX:29.91 centerY:86.25 diffFotos:PidgeonsA inContext:context];
    [Seed insertDiffs:83.16 topY:67.66 downX:100 downY:87.66 centerX:93.16 centerY:77.66 diffFotos:PidgeonsA inContext:context];
    [Seed insertDiffs:44.27 topY:24.02 downX:64.27 downY:44 centerX:54.27 centerY:34.02 diffFotos:PidgeonsA inContext:context];
    [Seed insertDiffs:37.86 topY:36.39 downX:57.86 downY:56.39 centerX:47.86 centerY:46.39 diffFotos:PidgeonsA inContext:context];
    
    Maze *Seagulls = [Maze createMaze:@"Seagulls" forTheme:animal inManagedObjectContext:context];
    Seagulls.dificulty = beginner;
    DifferenceFotos *SeagullsA = [DifferenceFotos createDifferenceFoto:@"SeagullsA" forMaze:Seagulls inManagedObjectContext:context];
    
    [Seed insertDiffs:83.58 topY:4.43 downX:100 downY:24.43 centerX:93.58 centerY:14.43 diffFotos:SeagullsA inContext:context];
    [Seed insertDiffs:56.66 topY:24.36 downX:76.66 downY:44.36 centerX:66.66 centerY:34.36 diffFotos:SeagullsA inContext:context];
    [Seed insertDiffs:65.64 topY:37 downX:85.64 downY:57 centerX:75.64 centerY:47 diffFotos:SeagullsA inContext:context];
    [Seed insertDiffs:46.8 topY:62.16 downX:66.8 downY:82.16 centerX:56.8 centerY:72.16 diffFotos:SeagullsA inContext:context];
    [Seed insertDiffs:2.82 topY:17.83 downX:22.82 downY:37.83 centerX:12.82 centerY:27.83 diffFotos:SeagullsA inContext:context];
    
    Maze *Small_Birds = [Maze createMaze:@"Small_Birds" forTheme:animal inManagedObjectContext:context];
    Small_Birds.dificulty = beginner;
    DifferenceFotos *Small_BirdsA = [DifferenceFotos createDifferenceFoto:@"Small_BirdsA" forMaze:Small_Birds inManagedObjectContext:context];
    
    [Seed insertDiffs:65.21 topY:2.02 downX:85.21 downY:22.02 centerX:75.21 centerY:12.02 diffFotos:Small_BirdsA inContext:context];
    [Seed insertDiffs:0 topY:18.86 downX:15.55 downY:38.86 centerX:5.55 centerY:28.86 diffFotos:Small_BirdsA inContext:context];
    [Seed insertDiffs:1.96 topY:37.76 downX:21.96 downY:57.76 centerX:11.96 centerY:47.76 diffFotos:Small_BirdsA inContext:context];
    [Seed insertDiffs:69.9 topY:31.92 downX:89.9 downY:51.92 centerX:79.9 centerY:41.92 diffFotos:Small_BirdsA inContext:context];
    [Seed insertDiffs:47.26 topY:68.69 downX:67.26 downY:88.69 centerX:57.26 centerY:78.69 diffFotos:Small_BirdsA inContext:context];
    
    Maze *Snail = [Maze createMaze:@"Snail" forTheme:animal inManagedObjectContext:context];
    Snail.dificulty = beginner;
    DifferenceFotos *SnailA = [DifferenceFotos createDifferenceFoto:@"SnailA" forMaze:Snail inManagedObjectContext:context];
    
    [Seed insertDiffs:8.37 topY:9.24 downX:28.37 downY:29.24 centerX:18.37 centerY:19.24 diffFotos:SnailA inContext:context];
    [Seed insertDiffs:16.9 topY:42.57 downX:36.9 downY:62.57 centerX:26.9 centerY:52.57 diffFotos:SnailA inContext:context];
    [Seed insertDiffs:83.58 topY:24.36 downX:100 downY:44.36 centerX:93.58 centerY:34.36 diffFotos:SnailA inContext:context];
    [Seed insertDiffs:50.25 topY:73.84 downX:70.25 downY:93.84 centerX:60.25 centerY:83.84 diffFotos:SnailA inContext:context];
    [Seed insertDiffs:73.76 topY:68.69 downX:93.76 downY:88.69 centerX:83.76 centerY:78.69 diffFotos:SnailA inContext:context];
    
    Maze *Spiderweb = [Maze createMaze:@"Spiderweb" forTheme:animal inManagedObjectContext:context];
    Spiderweb.dificulty = beginner;
    DifferenceFotos *SpiderwebA = [DifferenceFotos createDifferenceFoto:@"SpiderwebA" forMaze:Spiderweb inManagedObjectContext:context];
    
    [Seed insertDiffs:70.34 topY:5.46 downX:90.34 downY:25.46 centerX:80.34 centerY:15.46 diffFotos:SpiderwebA inContext:context];
    [Seed insertDiffs:81.45 topY:54.94 downX:100 downY:74.94 centerX:91.45 centerY:64.94 diffFotos:SpiderwebA inContext:context];
    [Seed insertDiffs:60.94 topY:66.63 downX:80 downY:86 centerX:70.94 centerY:76.63 diffFotos:SpiderwebA inContext:context];
    [Seed insertDiffs:5.81 topY:46.70 downX:25.81 downY:66.70 centerX:15.81 centerY:56.70 diffFotos:SpiderwebA inContext:context];
    [Seed insertDiffs:34.87 topY:46.70 downX:54.87 downY:66.70 centerX:44.87 centerY:56.70 diffFotos:SpiderwebA inContext:context];
    
    Maze *Fresh_Fishes = [Maze createMaze:@"Fresh_Fishes" forTheme:comida inManagedObjectContext:context];
    Fresh_Fishes.dificulty = beginner;
    DifferenceFotos *Fresh_FishesA = [DifferenceFotos createDifferenceFoto:@"Fresh_FishesA" forMaze:Fresh_Fishes inManagedObjectContext:context];
    
    [Seed insertDiffs:3.67 topY:3.4 downX:23.67 downY:23.4 centerX:13.67 centerY:13.40 diffFotos:Fresh_FishesA inContext:context];
    [Seed insertDiffs:30.17 topY:12.68 downX:50.17 downY:32.68 centerX:40.17 centerY:22.68 diffFotos:Fresh_FishesA inContext:context];
    [Seed insertDiffs:35.72 topY:76.25 downX:55.72 downY:96.25 centerX:45.72 centerY:86.25 diffFotos:Fresh_FishesA inContext:context];
    [Seed insertDiffs:75.04 topY:25.73 downX:95.04 downY:45.73 centerX:85.04 centerY:35.73 diffFotos:Fresh_FishesA inContext:context];
    [Seed insertDiffs:76.75 topY:49.10 downX:96.75 downY:69.10 centerX:86.75 centerY:59.10 diffFotos:Fresh_FishesA inContext:context];
    
    Maze *Sushi = [Maze createMaze:@"Sushi" forTheme:comida inManagedObjectContext:context];
    Sushi.dificulty = beginner;
    DifferenceFotos *SushiA = [DifferenceFotos createDifferenceFoto:@"SushiA" forMaze:Sushi inManagedObjectContext:context];
        
    [Seed insertDiffs:41.28 topY:9.58 downX:61.28 downY:29.58 centerX:51.28 centerY:19.58 diffFotos:SushiA inContext:context];
    [Seed insertDiffs:66.9 topY:43.6 downX:86.9 downY:63.6 centerX:76.9 centerY:53.6 diffFotos:SushiA inContext:context];
    [Seed insertDiffs:59.23 topY:53.23 downX:79.23 downY:73.23 centerX:69.23 centerY:63.23 diffFotos:SushiA inContext:context];
    [Seed insertDiffs:7.09 topY:51.85 downX:27.09 downY:71.85 centerX:17.09 centerY:61.85 diffFotos:SushiA inContext:context];
    [Seed insertDiffs:26.32 topY:27.8 downX:46.32 downY:47.8 centerX:36.32 centerY:37.8 diffFotos:SushiA inContext:context];
    
    Maze *Vegetables = [Maze createMaze:@"Vegetables" forTheme:comida inManagedObjectContext:context];
    Vegetables.dificulty = beginner;
    DifferenceFotos *VegetablesA = [DifferenceFotos createDifferenceFoto:@"VegetablesA" forMaze:Vegetables inManagedObjectContext:context];
        
    [Seed insertDiffs:30 topY:76.94 downX:50 downY:96.94 centerX:40 centerY:86.94 diffFotos:VegetablesA inContext:context];
    [Seed insertDiffs:72.05 topY:54.26 downX:92.05 downY:74.26 centerX:82.05 centerY:64.26 diffFotos:VegetablesA inContext:context];
    [Seed insertDiffs:69.05 topY:12.33 downX:89.05 downY:32.33 centerX:79.05 centerY:22.33 diffFotos:VegetablesA inContext:context];
    [Seed insertDiffs:11.79 topY:31.92 downX:31.79 downY:51.92 centerX:21.79 centerY:41.92 diffFotos:VegetablesA inContext:context];
    [Seed insertDiffs:9.23 topY:53.23 downX:29.23 downY:73.23 centerX:19.23 centerY:63.23 diffFotos:VegetablesA inContext:context];
    
    Maze *Squashes = [Maze createMaze:@"Squashes" forTheme:comida inManagedObjectContext:context];
    Squashes.dificulty = beginner;
    DifferenceFotos *SquashesA = [DifferenceFotos createDifferenceFoto:@"SquashesA" forMaze:Squashes inManagedObjectContext:context];
    
    [Seed insertDiffs:37 topY:1 downX:57 downY:20.99 centerX:47 centerY:10.99 diffFotos:SquashesA inContext:context];
    [Seed insertDiffs:36.58 topY:81.06 downX:56.58 downY:100 centerX:46.58 centerY:91.06 diffFotos:SquashesA inContext:context];
    [Seed insertDiffs:83.16 topY:36.04 downX:100 downY:56.04 centerX:93.16 centerY:46.04 diffFotos:SquashesA inContext:context];
    [Seed insertDiffs:12.2 topY:37.07 downX:32.2 downY:57.07 centerX:22.2 centerY:47.07 diffFotos:SquashesA inContext:context];
    [Seed insertDiffs:53.67 topY:40.51 downX:73.67 downY:60.51 centerX:63.67 centerY:50.51 diffFotos:SquashesA inContext:context];
    
    Maze *Salmon_Dish = [Maze createMaze:@"Salmon_Dish" forTheme:comida inManagedObjectContext:context];
    Salmon_Dish.dificulty = beginner;
    DifferenceFotos *Salmon_DishA = [DifferenceFotos createDifferenceFoto:@"Salmon_DishA" forMaze:Salmon_Dish inManagedObjectContext:context];
    
    [Seed insertDiffs:37.86 topY:7.18 downX:57.86 downY:27.18 centerX:47.86 centerY:17.18 diffFotos:Salmon_DishA inContext:context];
    [Seed insertDiffs:12.64 topY:32.95 downX:32.64 downY:52.95 centerX:22.64 centerY:42.95 diffFotos:Salmon_DishA inContext:context];
    [Seed insertDiffs:61 topY:44 downX:80 downY:63 centerX:70.94 centerY:53.26 diffFotos:Salmon_DishA inContext:context];
    [Seed insertDiffs:22.05 topY:57.35 downX:42.05 downY:77.35 centerX:32.05 centerY:67.35 diffFotos:Salmon_DishA inContext:context];
    [Seed insertDiffs:81.88 topY:79 downX:100 downY:99 centerX:91.88 centerY:89 diffFotos:Salmon_DishA inContext:context];
    
    
    Maze *Parsley = [Maze createMaze:@"Parsley" forTheme:comida inManagedObjectContext:context];
    Parsley.dificulty = beginner;
    DifferenceFotos *ParsleyA = [DifferenceFotos createDifferenceFoto:@"ParsleyA" forMaze:Parsley inManagedObjectContext:context];
    
    [Seed insertDiffs:84.87 topY:56.3 downX:100 downY:76.3 centerX:94.87 centerY:66.3 diffFotos:ParsleyA inContext:context];
    [Seed insertDiffs:36.58 topY:26.08 downX:56.58 downY:46.08 centerX:46.58 centerY:36.08 diffFotos:ParsleyA inContext:context];
    [Seed insertDiffs:37.86 topY:14.39 downX:57.86 downY:34.39 centerX:47.86 centerY:24.39 diffFotos:ParsleyA inContext:context];
    [Seed insertDiffs:24.61 topY:48.76 downX:44.61 downY:68.76 centerX:34.61 centerY:58.76 diffFotos:ParsleyA inContext:context];
    [Seed insertDiffs:3 topY:31 downX:22 downY:50 centerX:12.82 centerY:40.20 diffFotos:ParsleyA inContext:context];
    
    Maze *Gummys = [Maze createMaze:@"Gummys" forTheme:comida inManagedObjectContext:context];
    Gummys.dificulty = beginner;
    DifferenceFotos *GummysA = [DifferenceFotos createDifferenceFoto:@"GummysA" forMaze:Gummys inManagedObjectContext:context];
        
    [Seed insertDiffs:66.49 topY:57 downX:86.49 downY:77 centerX:76.49 centerY:67 diffFotos:GummysA inContext:context];
    [Seed insertDiffs:19.48 topY:28.14 downX:39.48 downY:48.144 centerX:29.48 centerY:38.144 diffFotos:GummysA inContext:context];
    [Seed insertDiffs:25 topY:44.29 downX:45 downY:64.29 centerX:35 centerY:54.29 diffFotos:GummysA inContext:context];
    [Seed insertDiffs:67.77 topY:24.36 downX:87.77 downY:44.36 centerX:77.77 centerY:34.36 diffFotos:GummysA inContext:context];
    [Seed insertDiffs:43.41 topY:25.73 downX:63.41 downY:45.73 centerX:53.41 centerY:35.73 diffFotos:GummysA inContext:context];
    
    Maze *Grill = [Maze createMaze:@"Grill" forTheme:comida inManagedObjectContext:context];
    Grill.dificulty = beginner;
    DifferenceFotos *GrillA = [DifferenceFotos createDifferenceFoto:@"GrillA" forMaze:Grill inManagedObjectContext:context];
        
    [Seed insertDiffs:6.6 topY:0 downX:26.6 downY:15.49 centerX:16.6 centerY:5.49 diffFotos:GrillA inContext:context];
    [Seed insertDiffs:70.34 topY:0 downX:90.34 downY:17.21 centerX:80.34 centerY:7.21 diffFotos:GrillA inContext:context];
    [Seed insertDiffs:7.52 topY:76.59 downX:27.52 downY:96.59 centerX:17.52 centerY:86.59 diffFotos:GrillA inContext:context];
    [Seed insertDiffs:27.6 topY:49.45 downX:47.6 downY:69.45 centerX:37.6 centerY:59.45 diffFotos:GrillA inContext:context];
    [Seed insertDiffs:55.81 topY:16.46 downX:75.81 downY:36.46 centerX:65.81 centerY:26.46 diffFotos:GrillA inContext:context];
    
    Maze *Fruit_Salad = [Maze createMaze:@"Fruit_Salad" forTheme:comida inManagedObjectContext:context];
    Fruit_Salad.dificulty = beginner;
    DifferenceFotos *Fruit_SaladA = [DifferenceFotos createDifferenceFoto:@"Fruit_SaladA" forMaze:Fruit_Salad inManagedObjectContext:context];

    [Seed insertDiffs:29.74 topY:80.03 downX:49.74 downY:100 centerX:39.74 centerY:90.03 diffFotos:Fruit_SaladA inContext:context];
    [Seed insertDiffs:67.35 topY:28.83 downX:87.35 downY:48.83 centerX:77.35 centerY:38.83 diffFotos:Fruit_SaladA inContext:context];
    [Seed insertDiffs:8.80 topY:16.80 downX:28.80 downY:36.8 centerX:18.8 centerY:26.8 diffFotos:Fruit_SaladA inContext:context];
    [Seed insertDiffs:81.45 topY:0 downX:100 downY:14.81 centerX:91.45 centerY:4.81 diffFotos:Fruit_SaladA inContext:context];
    [Seed insertDiffs:48.97 topY:1 downX:48.97 downY:20.65 centerX:58.97 centerY:10.65 diffFotos:Fruit_SaladA inContext:context];
    
    Maze *Berries = [Maze createMaze:@"Berries" forTheme:comida inManagedObjectContext:context];
    Berries.dificulty = beginner;
    DifferenceFotos *BerriesA = [DifferenceFotos createDifferenceFoto:@"BerriesA" forMaze:Berries inManagedObjectContext:context];
    
    [Seed insertDiffs:70.34 topY:7.86 downX:90.34 downY:27.86 centerX:80.34 centerY:17.86 diffFotos:BerriesA inContext:context];
    [Seed insertDiffs:73.76 topY:59.75 downX:93.76 downY:79.75 centerX:83.76 centerY:69.75 diffFotos:BerriesA inContext:context];
    [Seed insertDiffs:59.65 topY:80.37 downX:79.65 downY:100 centerX:69.65 centerY:90.37 diffFotos:BerriesA inContext:context];
    [Seed insertDiffs:38.29 topY:32.95 downX:58.29 downY:52.95 centerX:48.29 centerY:42.95 diffFotos:BerriesA inContext:context];
    [Seed insertDiffs:6.66 topY:39.82 downX:26.66 downY:59.82 centerX:16.66 centerY:49.82 diffFotos:BerriesA inContext:context];
    
    Maze *Crayfish = [Maze createMaze:@"Crayfish" forTheme:comida inManagedObjectContext:context];
    Crayfish.dificulty = beginner;
    DifferenceFotos *CrayfishA = [DifferenceFotos createDifferenceFoto:@"CrayfishA" forMaze:Crayfish inManagedObjectContext:context];
    
    [Seed insertDiffs:3.24 topY:23.67 downX:23.24 downY:43.67 centerX:13.24 centerY:33.67 diffFotos:CrayfishA inContext:context];
    [Seed insertDiffs:17.35 topY:83.47 downX:37.35 downY:100 centerX:27.35 centerY:93.47 diffFotos:CrayfishA inContext:context];
    [Seed insertDiffs:71.19 topY:30.89 downX:91.19 downY:50.89 centerX:81.19 centerY:40.89 diffFotos:CrayfishA inContext:context];
    [Seed insertDiffs:45.98 topY:50.13 downX:65.98 downY:70.13 centerX:55.98 centerY:60.13 diffFotos:CrayfishA inContext:context];
    [Seed insertDiffs:79.31 topY:17.14 downX:99.31 downY:37.14 centerX:89.31 centerY:27.14 diffFotos:CrayfishA inContext:context];
    
    Maze *Fakes_Shop = [Maze createMaze:@"Fakes_Shop" forTheme:comida inManagedObjectContext:context];
    Fakes_Shop.dificulty = beginner;
    DifferenceFotos *Fakes_ShopA = [DifferenceFotos createDifferenceFoto:@"Fakes_ShopA" forMaze:Fakes_Shop inManagedObjectContext:context];
    
    [Seed insertDiffs:75.89 topY:23.67 downX:95.89 downY:43.67 centerX:85.89 centerY:33.67 diffFotos:Fakes_ShopA inContext:context];
    [Seed insertDiffs:1 topY:54.94 downX:20.25 downY:74.94 centerX:10.25 centerY:64.94 diffFotos:Fakes_ShopA inContext:context];
    [Seed insertDiffs:30.59 topY:51.5 downX:50.59 downY:71.5 centerX:40.59 centerY:61.5 diffFotos:Fakes_ShopA inContext:context];
    [Seed insertDiffs:6.66 topY:0 downX:26.66 downY:17.56 centerX:16.66 centerY:7.56 diffFotos:Fakes_ShopA inContext:context];
    [Seed insertDiffs:46.83 topY:0 downX:66.83 downY:19.96 centerX:56.83 centerY:9.96 diffFotos:Fakes_ShopA inContext:context];
}




@end
