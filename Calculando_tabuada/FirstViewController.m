//
//  FirstViewController.m
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/3/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.game = [MultiplicationGame new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeLabels{
    [self.game changeCurrentOperation];
    self.lblFirstNumber.text = [NSString stringWithFormat:@"%i", [self.game.currentOperation firstNumber]];
    self.lblSecondNumber.text = [NSString stringWithFormat:@"%i", [self.game.currentOperation secondNumber]];
}

- (IBAction)changeOperation:(UIButton *)sender {
    [self changeLabels];
}

- (IBAction)sendAnswer:(UIButton *)sender {
}
@end
