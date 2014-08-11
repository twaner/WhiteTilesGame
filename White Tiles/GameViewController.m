//
//  GameViewController.m
//  White Tiles
//
//  Created by Taiowa Waner on 8/10/14.
//  Copyright (c) 2014 Taiowa Waner. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

/**
 * Sets the conditions for the end of the game. Stops Timer, Hides all Tiles, Hides buttons for tapping, and displays Exit button.
 **/
-(void)GameOver{

    // Stop Timer
    [Timer invalidate];
    // Hide all Tiles
    [self ShowOrHideAll:RowTileArray2D action:YES];
    // Hide tapper buttons
    for (UIButton *btn in ButtonArray) {
        btn.hidden = YES;
    }
    // Hide time label
    TimerLabel.hidden = YES;
    // Display Exit button
    Exit.hidden = NO;
    // High score
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
}

-(IBAction)RowDown1:(id)sender{
    [self TileMover:1];
}

-(IBAction)RowDown2:(id)sender{
    [self TileMover:2];
}

-(IBAction)RowDown3:(id)sender{
    [self TileMover:3];
}

-(IBAction)RowDown4:(id)sender{
    [self TileMover:4];
}

-(IBAction)RowDown5:(id)sender{
    [self TileMover:5];
}

/**
 * Moves tiles down for a given row. If a White Tile is pushed the GameOver method is called
 * @param row Row number that will be moved down.
 **/
-(void)TileMover:(int)row{
    
    switch (RowNumber) {
        case 1:
            if (Row1BlackTile == row) {
                [self TileMoveDown];
            } else {
                [self GameOver];
            }
            break;
        case 2:
            if (Row2BlackTile == row) {
                [self TileMoveDown];
            } else {
                [self GameOver];
            }
            break;
        case 3:
            if (Row3BlackTile == row) {
                [self TileMoveDown];
            } else {
                [self GameOver];
            }
            break;
        case 4:
            if (Row4BlackTile == row) {
                [self TileMoveDown];
            } else {
                [self GameOver];
            }
            break;
        case 5:
            if (Row5BlackTile == row) {
                [self TileMoveDown];
            } else {
                [self GameOver];
            }
            break;
        default:
            break;
    }
}

/**
 * Moves tiles down by incrementing the center.y value by the tile height.
 **/
-(void)TileMoveDown{
    
    [self Score];
    for (int i = 0; i < 5; i++) {
        for (int q = 0; q < 4; q++) {
            UIImageView *img = [[RowTileArray2D objectAtIndex:i]objectAtIndex:q];
            img.center = CGPointMake(Row1Tile1.center.x, Row1Tile1.center.y + 140);
        }
    }
    
    if (Row1Tile1.center.y > 500) {
        NSArray *tmpArr = [RowTileArray2D objectAtIndex:0];
        [self PlaceWholeRow:tmpArr atRow:0];
        [self PlaceBlackTile:tmpArr atIndex:0];
    }
    if (Row2Tile1.center.y > 500) {
        NSArray *tmpArr = [RowTileArray2D objectAtIndex:1];
        [self PlaceWholeRow:tmpArr atRow:1];
        [self PlaceBlackTile:tmpArr atIndex:1];
    }
    if (Row3Tile1.center.y > 500) {
        NSArray *tmpArr = [RowTileArray2D objectAtIndex:2];
        [self PlaceWholeRow:tmpArr atRow:2];
        [self PlaceBlackTile:tmpArr atIndex:2];
    }
    if (Row4Tile1.center.y > 500) {
        NSArray *tmpArr = [RowTileArray2D objectAtIndex:3];
        [self PlaceWholeRow:tmpArr atRow:3];
        [self PlaceBlackTile:tmpArr atIndex:3];
    }
    if (Row5Tile1.center.y > 500) {
        NSArray *tmpArr = [RowTileArray2D objectAtIndex:4];
        [self PlaceWholeRow:tmpArr atRow:4];
        [self PlaceBlackTile:tmpArr atIndex:4];
    }
    
//    RowNumber += 1;
//    if (RowNumber == 6) {
//        RowNumber = 1;
//    }
    
    RowNumber == 6 ? RowNumber = 1 : RowNumber + 1;
}

/**
 * Sets all tiles to white for the row.
 * @param row Row number to turn white
**/
-(void)SetToWhite:(NSArray *)tiles{
    
    for (UIImageView *q in tiles) {
        q.image = [UIImage imageNamed:@"WhiteTile.png"];
    }
}

/**
 * Places a black tile in a given row.
 * @param row Row number of tiles to place.
 **/
-(void)PlaceBlackTile:(NSArray *)tiles atIndex:(int)index{
    
    UIImageView *img = [tiles objectAtIndex:index];
    img.image = [UIImage imageNamed:@"BlackTile.png"];
}
/**
 * Places tiles for a given row.
 * @param row Row number of tiles to place.
 **/
-(void)PlaceRowTile:(int)row{
    
    NSArray *tmpArray = [RowTileArray2D objectAtIndex:row];
    
    [self SetToWhite:tmpArray];
    
    for (UIImageView *q in tmpArray) {
        q.image = [UIImage imageNamed:@"WhiteTile.png"];
    }
    
    int q = RowBlackTileArray[row];
    q = arc4random() % 4;
    q += 1;
    
    switch (q) {
        case 1:
            Row1Tile1.image = [UIImage imageNamed:@"BlackTile.png"];
//            UIImageView *img = [tmpArray objectAtIndex:row];
//            img.image = [UIImage imageNamed:@"BlackTile.png"];
            [self PlaceBlackTile:tmpArray atIndex:0];
            break;
        case 2:
//            Row1Tile2.image = [UIImage imageNamed:@"BlackTile.png"];
            [self PlaceBlackTile:tmpArray atIndex:1];
            break;
        case 3:
//            Row1Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            [self PlaceBlackTile:tmpArray atIndex:2];
            break;
        case 4:
//            Row1Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            [self PlaceBlackTile:tmpArray atIndex:3];
            break;
        default:
            break;
    }
}

-(void)PlaceRow1BlackTile{
//    Row1Tile1.image = [UIImage imageNamed:@"WhiteTile.png"];
//    Row1Tile2.image = [UIImage imageNamed:@"WhiteTile.png"];
//    Row1Tile3.image = [UIImage imageNamed:@"WhiteTile.png"];
//    Row1Tile4.image = [UIImage imageNamed:@"WhiteTile.png"];
    
//    for (int i = 0; i < 4; i++) {
//        UIImageView *tmp = [[RowTileArray2D objectAtIndex:0]objectAtIndex:i];
//        tmp.image = [UIImage imageNamed:@"WhiteTile.png"];
//    }
    
    NSArray *tmpArray = [RowTileArray2D objectAtIndex:0];
    [self SetToWhite:tmpArray];
    
    Row1BlackTile = arc4random() % 4;
    Row1BlackTile += 1;
    
    switch (Row1BlackTile) {
        case 1:
            Row1Tile1.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 2:
            Row1Tile2.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 3:
            Row1Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 4:
            Row1Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        default:
            break;
    }
}
-(void)PlaceRow2BlackTile{
    NSArray *tmpArray = [RowTileArray2D objectAtIndex:1];
    [self SetToWhite:tmpArray];
    Row2BlackTile = arc4random() % 4;
    Row2BlackTile += 1;
    
    switch (Row2BlackTile) {
        case 1:
            Row2Tile1.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 2:
            Row2Tile2.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 3:
            Row2Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 4:
            Row2Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        default:
            break;
    }

}
-(void)PlaceRow3BlackTile{
    NSArray *tmpArray = [RowTileArray2D objectAtIndex:2];
    [self SetToWhite:tmpArray];
    Row3BlackTile = arc4random() % 4;
    Row3BlackTile += 1;
    
    switch (Row3BlackTile) {
        case 1:
            Row3Tile1.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 2:
            Row3Tile2.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 3:
            Row3Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 4:
            Row3Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        default:
            break;
    }

}
-(void)PlaceRow4BlackTile{
    NSArray *tmpArray = [RowTileArray2D objectAtIndex:3];
    [self SetToWhite:tmpArray];
    Row4BlackTile = arc4random() % 4;
    Row4BlackTile += 1;
    
    switch (Row4BlackTile) {
        case 1:
            Row4Tile1.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 2:
            Row4Tile2.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 3:
            Row4Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 4:
            Row4Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        default:
            break;
    }

}
-(void)PlaceRow5BlackTile{
    NSArray *tmpArray = [RowTileArray2D objectAtIndex:4];
    [self SetToWhite:tmpArray];
    
    Row5BlackTile = arc4random() % 4;
    Row5BlackTile += 1;
    
    switch (Row5BlackTile) {
        case 1:
            Row5Tile1.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 2:
            Row5Tile2.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 3:
            Row5Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        case 4:
            Row5Tile3.image = [UIImage imageNamed:@"BlackTile.png"];
            break;
        default:
            break;
    }

}

/**
 * Places a new row.
 @param tiles Array to update.
 @param row row to update.
 **/
-(void)PlaceWholeRow:(NSArray *)tiles atRow:(int)row{
    float width = Row1Tile1.frame.size.width;
    float x = 40;
    
    for (int q = 0; q < 4; q++) {
        UIImageView *tmp = [tiles objectAtIndex:q];
        tmp.center = CGPointMake(x + q * width, -66);
    }
}

/**
 * Starts timer countdown and sets label text.
 * Determines if score is a multiple of 50 to set TimerNumber to 10 and if TimeNumber is less than 0
 **/
-(void)TimerCountdown{
    
    TimerNumber -= 0.01;
    TimerLabel.text = [NSString stringWithFormat:@"Time: %.2f", TimerNumber];
    
    TimerNumber = ScoreNumber % 50 == 0 ? 10 : TimerNumber;
    
    if (TimerNumber < 0) {
        [self GameOver];
    }

}

/**
 * Increments score counter and sets label text.
 **/
-(void)Score{
    
    ScoreNumber += 1;
    ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", ScoreNumber];
}

/**
 * Starts a new Game.
 * Sets Timer to 10 seconds, Places a black tile in all rows. Shows all tiles.
 **/
-(IBAction)StartGame:(id)sender{
    
    Timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TimerCountdown) userInfo:nil repeats:NO];
    
    float width = Row1Tile1.frame.size.width;
    float height = Row1Tile1.frame.size.height;
    float x = 40;
    float y = 498;
    
    [self PlaceRow1BlackTile];
    [self PlaceRow2BlackTile];
    [self PlaceRow3BlackTile];
    [self PlaceRow4BlackTile];
    [self PlaceRow5BlackTile];
    
    
    for (int i = 0; i < 5; i++) {
        for (int q = 0; q < 4; q++) {
            UIImageView *img = [[RowTileArray2D objectAtIndex:i]objectAtIndex:q];
            img.center = CGPointMake(x + q * width, y - i * height);
        }
    }
    
//    Row1Tile1.center = CGPointMake(x, y);
//    Row1Tile2.center = CGPointMake(x + width, y);
//    Row1Tile3.center =CGPointMake(x + 2 * width, y);
//    Row1Tile4.center =CGPointMake(x + 3 * width, y);
//
//    Row2Tile1.center = CGPointMake(x, y - height);
//    Row2Tile2.center = CGPointMake(x + width, y - height);
//    Row2Tile3.center =CGPointMake(x + 2 * width, y - height);
//    Row2Tile4.center =CGPointMake(x + 3 * width, y - height);
//    
//    Row3Tile1.center = CGPointMake(x, y - height *2);
//    Row3Tile2.center = CGPointMake(x + width, y - height * 2);
//    Row3Tile3.center =CGPointMake(x + 2 * width, y - height * 2);
//    Row3Tile4.center =CGPointMake(x + 3 * width, y - height * 2);
//    
//    Row4Tile1.center = CGPointMake(x, y - height *3);
//    Row4Tile2.center = CGPointMake(x + width, y - height * 3);
//    Row4Tile3.center =CGPointMake(x + 2 * width, y - height * 3);
//    Row4Tile4.center =CGPointMake(x + 3 * width, y - height * 3);
//    
//    Row5Tile1.center = CGPointMake(x, y - height * 4);
//    Row5Tile2.center = CGPointMake(x + width, y - height * 4);
//    Row5Tile3.center =CGPointMake(x + 2 * width, y - height * 4);
//    Row5Tile4.center =CGPointMake(x + 3 * width, y - height * 4);
    
    // Show Tiles
    [self ShowOrHideAll:RowTileArray2D action:NO];
    
//    for (UIImageView *q in RowTileArray) {
//        q.hidden = NO;
//    }
    
    Start.hidden = YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/**
 * Sets the hidden property to YES/NO for all tiles in array
 *@param tiles Array of tiles.
 *@param action Show or Hide boolean.
 **/
-(void)ShowOrHideAll:(NSArray *)tiles action:(BOOL)show{
    
    for (NSArray *q in tiles) {
        for (UIImageView *r in q) {
            r.hidden = show;
        }
    }
}

- (void)viewDidLoad
{
    // Button Setup
    ButtonArray = [NSArray arrayWithObjects:
                   Button1,
                   Button2,
                   Button3,
                   Button4, nil];
    
    for (UIButton *b in ButtonArray) {
        b.hidden = YES;
    }
    
    RowNumber = 1;
    
    // Set Starting conditions
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    ScoreNumber = 0;
    TimerNumber = 10;
    Exit.hidden = YES;
    
    
    // Tile Setup
    NSArray * Row1TileArray = [NSArray arrayWithObjects:
                     Row1Tile1,
                     Row1Tile2,
                     Row1Tile3,
                     Row1Tile4,
                     nil];
    NSArray *Row2TileArray = [NSArray arrayWithObjects:
                     Row2Tile1,
                     Row2Tile2,
                     Row2Tile3,
                     Row2Tile4,
                     nil];
    NSArray *Row3TileArray = [NSArray arrayWithObjects:
                     Row3Tile1,
                     Row3Tile2,
                     Row3Tile3,
                     Row3Tile4,
                     nil];
    NSArray *Row4TileArray = [NSArray arrayWithObjects:
                     Row4Tile1,
                     Row4Tile2,
                     Row4Tile3,
                     Row4Tile4,
                     nil];

    NSArray *Row5TileArray = [NSArray arrayWithObjects:
                     Row5Tile1,
                     Row5Tile2,
                     Row5Tile3,
                     Row5Tile4,
                     nil];
    
    RowTileArray2D = [NSArray arrayWithObjects:
                     Row1TileArray,
                     Row2TileArray,
                     Row3TileArray,
                     Row4TileArray,
                     Row5TileArray, nil];
    
    RowBlackTileArray[0] = Row1BlackTile;
    RowBlackTileArray[1] = Row1BlackTile;
    RowBlackTileArray[2] = Row1BlackTile;
    RowBlackTileArray[3] = Row1BlackTile;
    RowBlackTileArray[4] = Row1BlackTile;
    
    [self ShowOrHideAll:RowTileArray2D action:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
