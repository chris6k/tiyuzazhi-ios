//
//  ShareView.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/7.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView
@synthesize magazineArticlesData;
@synthesize shareBorderView;
@synthesize shareContainView;
@synthesize shareTag;

-(void)viewDidLoad {
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}



-(void)initView
{
    [self.view setBackgroundColor:[UIColor clearColor]];
    shareContainView.layer.masksToBounds = YES;
    shareContainView.layer.cornerRadius =6;
    

    
    shareBorderView.layer.masksToBounds = YES;
    shareBorderView.layer.cornerRadius =6;
    shareBorderView.layer.borderWidth = 1;
    
    
    


}

#pragma mark - 按钮事件

- (IBAction)returnSuper:(id)sender {
        [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)DoShare:(id)sender {
    
    
    NSInteger tag = ((UIButton *)sender).tag;
    switch (tag) {
        case 1:
            shareTag = @"1";
            break;
        case 2:
            shareTag = @"2";

            break;
        case 3:
            shareTag = @"3";

            break;
        case 4:
            shareTag = @"4";

            break;
        case 5:
            shareTag = @"5";

            break;
        case 6:
            shareTag = @"6";

            break;

        default:
        
            break;
    }
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];

    [self  performSegueWithIdentifier:@"segueShareContentView" sender:sender];

    
    
   }



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if([segue.identifier isEqualToString:@"segueShareContentView"])
    {
        [segue.destinationViewController setValue:magazineArticlesData forKey:@"magazineArticlesData"];
 

        [segue.destinationViewController setValue: shareTag
                                           forKey:@"shareTag"];
        
    }
}


- (IBAction)unwindShareViewController:(UIStoryboardSegue *)segue
{

}

@end
