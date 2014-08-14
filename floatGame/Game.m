//
//  Game.m
//  floatGame
//
//  Created by DetroitLabsUser on 3/30/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "Game.h"
#import "DLViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface Game ()

@end

@implementation Game

- (IBAction)buttonPressed:(id)sender {
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [Player.layer addAnimation:rotation forKey:@"Player"];
}

-(IBAction)StartGame:(id)sender {
    
    TunnelBottom.hidden = NO;
    TunnelTop.hidden = NO;
    
    startGame.hidden = YES;
    
    playerMovement = [NSTimer scheduledTimerWithTimeInterval:0.09 target:self selector:@selector(PlayerMoving) userInfo:nil repeats:YES];

    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.007 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
    // ^ want to slow down the tunnels? Increase the interval above.
    
}

-(void)TunnelMoving {
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x -1, TunnelBottom.center.y);
    
    if (TunnelTop.center.x < -28) {
        [self PlaceTunnels];
        
    }
}


-(void)PlaceTunnels{
    
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 645;
    // ^ want to make the game harder? Make the gap smaller by reducing the "655" number
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);
    
}

-(void)PlayerMoving {
    
    Player.center = CGPointMake(Player.center.x, Player.center.y - PlayerFlight);
    
    PlayerFlight = PlayerFlight - 15;
    
    // V this limits how far the player can drop
    if (PlayerFlight < -15) {
        PlayerFlight = -15;
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    PlayerFlight = 30;

    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    [super viewDidLoad];
    ScoreNumber = 0;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
