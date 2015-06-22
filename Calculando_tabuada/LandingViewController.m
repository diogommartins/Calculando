//
//  LandingViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/7/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "LandingViewController.h"
#import "UIImage+ImageEffects.h"
#import "DMLeaderboard.h"

@interface LandingViewController()

-(void)applyBlurToBackground;
-(void)saveUsername;
-(void)setUsernameLabelPlaceholderFromDefaults;
- (IBAction)touchedStartNewGameButton:(UIButton *)sender;

@end

@implementation LandingViewController

-(void)applyBlurToBackground
{
    UIImage * blurredBackground = [self.background.image applyBlurWithRadius: 30.0
                                                                   tintColor: [UIColor clearColor]
                                                       saturationDeltaFactor: 1.0
                                                                   maskImage: nil];
    [self.background setImage: blurredBackground];
    [self.background.image applyLightEffect];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self applyBlurToBackground];
    [self setUsernameLabelPlaceholderFromDefaults];
}

-(void)setUsernameLabelPlaceholderFromDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString * username = [defaults objectForKey:@"username"];
    if (username)
        [self.lblUsername setPlaceholder: [NSString stringWithFormat:@"Usuário: %@", username]];
}

- (IBAction)touchedStartNewGameButton:(UIButton *)sender
{
    [self saveUsername];
}

-(void)saveUsername
{
    NSString * username = self.lblUsername.text;
    if ([username length] > 0){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:username forKey:@"username"];
        [defaults synchronize];
    }
}

@end
