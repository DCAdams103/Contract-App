//
//  SlideShowViewController.m
//  Contract test
//
//  Created by Dylan Adams on 7/5/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import "SlideShowViewController.h"
#import "GameViewController.h"

@interface SlideShowViewController ()

@end

// For the Slideshow part of app

@implementation SlideShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewDidAppear:(BOOL)animated{
    
    first = TRUE;
    
    orderInt = 1;
    
    restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    restClient.delegate = self;
    
    [self didPressLink];
    
}

- (IBAction)didPressLink {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    } else {
        
        [self downloadFiles];
        
    }
}

// Grabs the photos from Dropbox

-(void) downloadFiles{
    
    switch (orderInt) {
        case 1:
            imageName = @"image1";
            break;
        case 2:
            imageName = @"image2";
            break;
        case 3:
            imageName = @"image3";
            break;
        case 4:
            imageName = @"image4";
            break;
        case 5:
            imageName = @"image5";
            break;
//        case 6:
//            imageName = @"image6";
//            break;
            
        default:
            break;
    }
    
    if(first == TRUE){
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsPath = [paths objectAtIndex:0]; //Get the docs directory
        
    }
    
    filePath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpeg", imageName]];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    // If it doesnt exist go grab it from dropbox
    if(fileExists == FALSE){
        
         [restClient loadFile:[NSString stringWithFormat:@"/Slideshow Images/%@.jpeg", imageName] intoPath:filePath];
    
        NSLog(@"%@", imageName);
        
    }
    
    // Loads the files only once
    if(first == TRUE){
        
        NSLog(@"first");
        
        [restClient loadFile:[NSString stringWithFormat:@"/Slideshow Images/image1.jpeg"] intoPath:filePath];
        
        UIImage *slideshowImage = [[UIImage alloc] initWithContentsOfFile: filePath];
        _slideShowImageView.image = slideshowImage;
        
        firstTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animationMethod) userInfo:nil repeats:YES];
        
        //first = FALSE;
        
    }
    
}

-(IBAction) unwindToSlideshow:(UIStoryboardSegue *) segue{
    
    
    
}

// Switches photos every 6 seconds.
-(void) animationMethod{
    
    if(orderInt == 1 && first == TRUE){
        
        if(firstTimer){
            
            [firstTimer invalidate];
            firstTimer = nil;
            
            orderInt = 2;
            
            first = FALSE;
            
            mainTimer = [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(animationMethod) userInfo:nil repeats:YES];
            
        }
        
    } else if(orderInt == 1 && first == FALSE){
        
        [self downloadFiles];
        
        [UIView transitionWithView:_slideShowImageView
                          duration:1
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _slideShowImageView.image = [UIImage imageNamed:filePath];
                        } completion:nil];
        orderInt = 2;
        
    } else if (orderInt == 2){
        
        [self downloadFiles];
        
        [UIView transitionWithView:_slideShowImageView
                          duration:1 options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _slideShowImageView.image = [UIImage imageNamed:filePath];
                        }completion:nil];
        
        orderInt = 3;
        
    } else if (orderInt == 3){
        
        [self downloadFiles];
        
        [UIView transitionWithView:_slideShowImageView
                          duration:1 options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _slideShowImageView.image = [UIImage imageNamed:filePath];
                        }completion:nil];
        
        orderInt = 4;
        
    } else if (orderInt == 4){
        
        [self downloadFiles];
        
        [UIView transitionWithView:_slideShowImageView
                          duration:1 options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _slideShowImageView.image = [UIImage imageNamed:filePath];
                        }completion:nil];
        
        orderInt = 5;
        
    } else if (orderInt == 5){
        
        [self downloadFiles];
        
        [UIView transitionWithView:_slideShowImageView
                          duration:1 options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _slideShowImageView.image = [UIImage imageNamed:filePath];
                        }completion:nil];
        
        orderInt = 1 ;
        
    }/* else if (orderInt == 6){
        
        [self downloadFiles];
        
        [UIView transitionWithView:_slideShowImageView
                          duration:1 options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _slideShowImageView.image = [UIImage imageNamed:filePath];
                        }completion:nil];
        
        
        
        NSLog(@"Image 6: %@", filePath);
        
        orderInt = 1;
        
    }*/
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [mainTimer invalidate];
    mainTimer = nil;
    orderInt = 0;
    
}

// Once touched it will switch out of slideshow
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self performSegueWithIdentifier:@"passSegueSlideshow" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
