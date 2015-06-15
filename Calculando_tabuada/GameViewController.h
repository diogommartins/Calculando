//
//  FirstViewController.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiplicationGame.h"
#import "Timer.h"

@interface GameViewController : UIViewController <TimerDelegate, GameDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblFirstNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondNumber;
@property (weak, nonatomic) IBOutlet UITextField *fieldAnswer;
@property (weak, nonatomic) IBOutlet UILabel *lblOperation;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lblTosco;

@property (weak, nonatomic) IBOutlet UILabel *lblFeedback;
@property (weak, nonatomic) IBOutlet UIView *feedbackBackground;

@property (weak, nonatomic) IBOutlet UIButton *btnRefresh;

@property (strong, nonatomic) Timer *timer;
@property (strong, nonatomic) MultiplicationGame *game;

- (IBAction)changeOperation:(UIButton *)sender;
- (void)sendAnswer;

-(void) updateNumbersLabels;

@end

