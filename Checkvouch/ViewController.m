//
//  ViewController.m
//  Mole
//
//  Created by Chris Mitchell on 2/1/15.
//  Copyright (c) 2015 Chris Mitchell. All rights reserved.
//

#import "ViewController.h"




#import <Firebase/Firebase.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    // Create the data model
    
    
    
    
    _pageTitles = @[@"The best way to find out about any product/vendor before your organization makes a purchase by talking to their customers directly. Join today for free and benefit from the experience of others.", @"Rate products/vendors that your organization has used. If you are unsatisfied with a current vendor Checkvouch can help them improve. Users can message you and learn from your experience.", @"Message people at organizations who have used the product/vendor that you are considering purchasing for your workplace. All users can be verified by Linkedin. All messages disappear permenantly in 15 seconds after they're read."];
    
    
    
    
    // _pageImages = @[@"blue8.jpg", @"8.png", @"4.png", @"2.png", @"5.png", @"6.png"];
    
    
    _pageImages = @[@"blue8.jpg", @"blue8.png", @"blue8.png",];
    
    
    
    _pageTitlesTwo = @[@"WELCOME TO ", @"FOR CUSTOMERS AND CLIENTS ", @"FOR BUYERS "];
    
    
    _pageTitlesThree = @[@"CHECKVOUCH", @"  ", @" "];
    
    
    
    
    
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)cancelLogin:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelLogin"]) {
        
        
    } }





- (IBAction)cancelProfile: (UIStoryboardSegue *)segue  {
    
    
    if ([[segue identifier] isEqualToString:@"cancelProfile"]) {
        
        
        
        // DeleteProfileViewController *editController = [segue sourceViewController];
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        
        if (ref.authData) {
            
            // [self configureViewTwo];
            
            
            // user authenticated
            //  NSLog(@"%@", ref.authData);
            
            
            
            NSString *idd = ref.authData.uid;
            
            
            Firebase *ref2 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            
            //  [  [[ref2 queryOrderedByChild:@"retrieveFromUserid"] queryEqualToValue: idd]
            
            
            //   observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
            
            
            [[[ref2  queryOrderedByKey] queryEqualToValue:@"workplaces"]
             
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
                 
                 
                 
                 //   snapshot.ref.removeValue;
                 
                 //  [snapshot.ref removeValue];
                 
                 
                 
                 for (FDataSnapshot* childSnap in snapshot.children) {
                     
                     
                     
                     if (   [ childSnap.value[@"userid"] isEqualToString: idd]   ){
                         
                         
                         
                         NSString *objectidd=   childSnap.value[@"workplaceid"];
                         
                         //  NSLog(@"%@", objectidd);
                         
                         
                         Firebase *ref5 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users/workplaces" ];
                         
                         
                         Firebase *usersRef = [ref5 childByAppendingPath: objectidd];
                         
                         //  NSLog(@"%@", usersRef);
                         
                         [usersRef setValue:   NULL];
                         
                         //  [usersRef removeValue];
                         
                         
                         
                     }
                     
                     
                     
                 }
                 
                 
                 // snapshot.key
                 
                 //
                 
             }];
            
            
            
            
            
            
            
            
            
            
            
            Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            [[[ref  queryOrderedByKey] queryEqualToValue: idd]
             
             observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
                 
                 
                // NSLog(@"%@", snapshot.key);
                 
                 
                 
                 
                 NSString *useremail  = snapshot.value[@"email"];
                 
                 
                 NSString *userpassword =  snapshot.value[@"password"];
                 
                 Firebase *ref22 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
                 
                 
                 [ref22 removeUser:useremail password:userpassword
                  
                  
               withCompletionBlock:^(NSError *error) {
                   
                   if (error) {
                       
                    //   NSLog(@"%@", error);
                       
                       // There was an error processing the request
                       
                   } else {
                       
                       // User deleted
                       
                   }
                   
               }];
                 
                 
                 
                 
             }];
            
            
            
            
            
            
            
            Firebase *ref6 = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com/users" ];
            
            
            Firebase *usersRef6 = [ref6 childByAppendingPath: idd];
            
            
            // NSLog(@"%@", usersRef6);
            
            
            
            [usersRef6 setValue:   NULL];
            
            //  [usersRef removeValue];
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        } else {
            
            
            
            [self performSegueWithIdentifier:@"CancelLogout" sender:self];
            
            
            // No user is signed in
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
}





- (IBAction)logoutfirebase:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"logoutfirebase"]) {
        
        Firebase *ref = [[Firebase alloc] initWithUrl:@"https://test75.firebaseio.com"];
        
        [ref unauth];
        
        
        
        
    } }






- (IBAction)startWalkthrough:(id)sender {
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = @[startingViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
}




- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index

{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pageContentViewController.imageFile = self.pageImages[index];
    
    
    pageContentViewController.titleText = self.pageTitles[index];
    
    
    pageContentViewController.titleTextTwo = self.pageTitlesTwo[index];
    
    pageContentViewController.titleTextThree = self.pageTitlesThree[index];
    
    
    pageContentViewController.pageIndex = index;
    
    
    return pageContentViewController;
    
}





#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}



- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}



- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
