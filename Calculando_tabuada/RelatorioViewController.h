//
//  RelatorioViewController.h
//  Calculando_tabuada
//
//  Created by Diogo Martins on 6/11/15.
//  Copyright (c) 2015 Diogo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiplicationGame.h"

@interface RelatorioViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *backgroundRightsAndWrongs;
@property (weak, nonatomic) IBOutlet UITableView *operationsTable;
@property (weak, nonatomic) IBOutlet UILabel *lblRightsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblWrongsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblRightsCount;
@property (weak, nonatomic) IBOutlet UILabel *lblWrongsCount;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;

@property (strong, nonatomic) MultiplicationGame *game;

@end
