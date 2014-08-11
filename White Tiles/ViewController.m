//
//  ViewController.m
//  White Tiles
//
//  Created by Taiowa Waner on 8/10/14.
//  Copyright (c) 2014 Taiowa Waner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    HighScoreLabel.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNumber];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
