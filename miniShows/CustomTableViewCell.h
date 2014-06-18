//
//  CustomTableViewCell.h
//  miniShows
//
//  Created by Fernando Garcia Corrochano on 18/06/14.
//  Copyright (c) 2014 ironHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *Show;
@property (weak, nonatomic) IBOutlet UILabel *chapter;
@property (weak, nonatomic) IBOutlet UILabel *behind;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftContraintBehind;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraintBehind;

@end
