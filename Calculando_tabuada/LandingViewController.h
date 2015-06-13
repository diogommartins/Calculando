//
//  LandingViewController.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/7/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIButton *btnNewGame;

- (IBAction)touchedStartNewGameButton:(UIButton *)sender;

@end
