//
//  Game.h
//  floatGame
//
//  Created by DetroitLabsUser on 3/30/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

int PlayerFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger *highScore;


@interface Game : UIViewController

{
    IBOutlet UIImageView *Player;
    IBOutlet UIButton *startGame;
    
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *playerMovement;
    NSTimer *TunnelMovement;
}


-(IBAction)StartGame:(id)sender;
-(void)PlayerMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
