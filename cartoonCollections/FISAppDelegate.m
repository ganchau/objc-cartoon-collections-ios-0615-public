//
//  FISAppDelegate.m
//  cartoonCollections
//
//  Created by Joe Burgess on 6/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    NSArray *dwarvesToBeRollCalled = @[@"Doc",@"Dopey",@"Bashful"];
    NSLog(@"%@",[self rollCallDwarves:dwarvesToBeRollCalled]);

    NSArray *callsToBeGivenWithHeart = @[@"earth",@"wind"];
    NSLog(@"%@",[self summonCaptainPlanet:callsToBeGivenWithHeart]);

    NSLog(@"%@",[self longPlaneteerCalls:callsToBeGivenWithHeart]);

    NSArray *possibleCheeses= @[@"prosciutto", @"cambert", @"baguette"];
    NSLog(@"%@",[self findTheCheese:possibleCheeses]);

    NSArray *scroogesMoney = @[@"$$",@"$",@"$$$"];
    NSLog(@"%@",[self calculateDollarAmountsWithReceipt:scroogesMoney]);

    
    return YES;
}

- (NSString *)rollCallDwarves:(NSArray *)dwarves
{
    NSString *rollCallString = @"";  // stores the roll call of dwarves
    NSString *stringToAppend = @"";  // stores the formatted string to append to the roll call
    for (NSUInteger i=0; i<[dwarves count]; i++) {
        if (i == 0) {   // if it's the first string, start with 1. "dwarf"
            stringToAppend = [NSString stringWithFormat:@"%lu. %@", i+1, dwarves[i]];
        } else {  // else if it's not the first string, start with " | #. 'dwarf'"
            stringToAppend = [NSString stringWithFormat:@" | %lu. %@", i+1, dwarves[i]];
        }   // append the formatted string with the current roll call
        rollCallString = [rollCallString stringByAppendingString:stringToAppend];
    }
    return rollCallString;  // return the formatted roll call
}

- (NSArray *)summonCaptainPlanet:(NSArray *)planteerCalls
{
    NSMutableArray *ForcesWithHeart = [@[] mutableCopy];   // store the CALLS! in mutable array
    for (NSUInteger i=0; i<[planteerCalls count]; i++) {
        ForcesWithHeart[i] = [[planteerCalls[i] uppercaseString] stringByAppendingString:@"!"];   // make the calls uppercase with exclamation point.
    }
    return [ForcesWithHeart copy];   // return the immutable array of CALLS!
}

- (NSArray *)longPlaneteerCalls:(NSArray *)planteerCalls
{
    NSMutableArray *longCalls = [@[] mutableCopy];   // store long calls in mutable array
    for (NSUInteger i=0;  i<[planteerCalls count]; i++) {
        if ([planteerCalls[i] length] > 4) {    // if the call is greater than 4 characters
            [longCalls addObject:planteerCalls[i]];    // add the call to the long calls array
        }
    }
    return [longCalls copy];    // return the immutable array of long calls
}

- (NSString *)findTheCheese:(NSArray *)cheeses
{
    NSArray *cheeseArray = @[@"cheddar", @"gouda", @"cambert"];   // store possible cheeses in an array
    for (NSUInteger i=0; i<[cheeses count]; i++) {
        if ([cheeseArray containsObject:cheeses[i]]) {    // if the first parameters is contained in the cheese array
            return cheeses[i];    // return the first parameter found
        }
    }
    return nil;   // return nil if no cheese found
}

- (NSArray *)calculateDollarAmountsWithReceipt:(NSArray *)receipt
{
    NSMutableArray *convertedReceiptArray = [@[] mutableCopy];   // store converted receipt in mutable array
    for (NSUInteger i=0; i<[receipt count]; i++) {
        // convert receipt to "$#" based on the length of "$", example: $$$ -> $3
        convertedReceiptArray[i] = [NSString stringWithFormat:@"$%lu", (unsigned long)[receipt[i] length]];
    }
    return [convertedReceiptArray copy];  // return immutable array of converted receipt
}














- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
