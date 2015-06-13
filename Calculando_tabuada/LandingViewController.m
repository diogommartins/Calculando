//
//  LandingViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/7/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "LandingViewController.h"
#import "UIImage+ImageEffects.h"

@interface LandingViewController()

-(void)applyBlurToBackground;

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
}

- (IBAction)touchedStartNewGameButton:(UIButton *)sender {
}

@end
