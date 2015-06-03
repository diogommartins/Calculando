//
//  FirstViewController.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiplicationGame.h"
#define MAX_NUMBER_TO_MULTIPLY 9

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblFirstNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondNumber;
@property (weak, nonatomic) IBOutlet UITextField *fieldAnswer;
@property (weak, nonatomic) IBOutlet UILabel *lblOperation;

@property (weak, nonatomic) IBOutlet UIButton *btnRefresh;
@property (weak, nonatomic) IBOutlet UIButton *btnSend;

@property (strong, nonatomic) MultiplicationGame * game;

- (IBAction)changeOperation:(UIButton *)sender;
- (IBAction)sendAnswer:(UIButton *)sender;

-(void) changeLabels;

@end

