//
//  AppDelegate.h
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@class InicialViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate,FBSessionDelegate,FBRequestDelegate,FBDialogDelegate>{
    Facebook *facebook;
    NSMutableDictionary *userPermissions;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) NSMutableDictionary *userPermissions;
-(void)facebookLogin;
-(void)facebookLogout;
-(void)apiGraphFriends;
-(void)postOnWall;
-(void)postOnwallWithoutAsking;
@end
