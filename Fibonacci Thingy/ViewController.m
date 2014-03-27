//
//  ViewController.m
//  Fibonacci Thingy
//
//  Created by owen chen on 3/26/2014.
//  Copyright (c) 2014 bowen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];			
    unsigned int f0 = 0, f1 = 1, temp;

    
    self.array = [NSMutableArray array];

    
    NSString *output = [NSString stringWithFormat:@"%i",f1];
    [_array addObject:output];
    
    
    do
    {
        temp = f1;
        f1 += f0;
        f0 = temp;
        NSString *output = [NSString stringWithFormat:@"%i",f1];
        [_array addObject:output];
    }while(f1+f0 <= 2147483647);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}

@end
