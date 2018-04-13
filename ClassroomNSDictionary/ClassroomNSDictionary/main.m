//
//  main.m
//  ClassroomNSDictionary
//
//  Created by Dmitriy Tarelkin on 13/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        
//1 Create NSDictionary using literal declaration.
        NSDictionary* dictionary = @{
                                     @1 : @"first",
                                     @2 : @"second",
                                     @3 : @"third"
                                     };
        
//2 Make it mutable and add several new entries.
        NSMutableDictionary* mutDict = [dictionary mutableCopy];
        [mutDict setObject:@"four_entry" forKey:@4];
        [mutDict setObject:@"five_entry" forKey:@5];
        [mutDict setObject:@"zero_entry" forKey:@0];
        
        NSLog(@"%@", [mutDict description]);
        
        
//3 Sort it in an ascending and descending order.
        [mutDict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2];
        }];
    
        NSLog(@"%@", [mutDict description]);
        
        NSArray* keys = [mutDict allKeys];
        //in ascending order
        NSArray* sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2];
        }];
        
        NSLog(@"Ascending %@",[sortedKeys componentsJoinedByString:@"-"]);
        
        //in descending order
        sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 compare:obj1];
        }];
        
        NSLog(@"Descenfing %@",[sortedKeys componentsJoinedByString:@"-"]);

//4 Check whether required value is contained in the dictionary.
        //[dictionary release];
        [mutDict release];
        [keys release];
        [sortedKeys release];
        
// these objects were deallocated and these calls will crash program
        
        [dictionary objectForKey:@0]; // except this call, because it's dictionary was made by literal
        //[mutDict objectForKey:@1];
        //[keys objectAtIndex:0];
        //[sortedKeys objectAtIndex:0];
        

        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
