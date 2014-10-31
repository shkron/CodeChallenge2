//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Alex on 10/30/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "RootViewController.h"
#import "CityDetail.h"
#import "CityDetailViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property CityDetail *theCity;
@property NSMutableArray *cityArray;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CityDetail *sanFrancisco = [[CityDetail alloc] initWithCityName:@"San Francisco"
                                                      withCityState:@"California"
                                                        withCityURL:@"http://en.wikipedia.org/wiki/San_Francisco"];
    sanFrancisco.cityImage = [UIImage imageNamed:@"sanfrancisco"];
    CityDetail *chicago = [[CityDetail alloc] initWithCityName:@"Chicago"
                                                 withCityState:@"Illionis"
                                                   withCityURL:@"http://en.wikipedia.org/wiki/Chicago"];
    chicago.cityImage = [UIImage imageNamed:@"chicago"];
    CityDetail *minsk = [[CityDetail alloc] initWithCityName:@"Minsk"
                                                      withCityState:@"Belarus"
                                                        withCityURL:@"http://en.wikipedia.org/wiki/Minsk"];
    minsk.cityImage = [UIImage imageNamed:@"minsk"];
    CityDetail *portland = [[CityDetail alloc] initWithCityName:@"Portland"
                                                 withCityState:@"Oregon"
                                                   withCityURL:@"http://en.wikipedia.org/wiki/Portland,_Oregon"];
    portland.cityImage = [UIImage imageNamed:@"portland"];


    self.cityArray = [@[sanFrancisco, chicago, minsk, portland] mutableCopy];
  

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];

}

#pragma mark - tableView methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cityArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.cityArray[indexPath.row] cityName];
    cell.detailTextLabel.text = [self.cityArray[indexPath.row] cityState];

    cell.imageView.image = [self.cityArray[indexPath.row] cityImage];
    

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSString *deleteTheCity = [NSString stringWithFormat:@"Are you sure you would like to delete %@ item?", [self.cityArray[indexPath.row] cityName]];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Confirmation"
                                                                       message:deleteTheCity
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *delete = [UIAlertAction actionWithTitle:@"Delete"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action)
                                 {
                                     UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                                     cell.accessoryType = UITableViewCellAccessoryNone;
                                     [self.cityArray removeObjectAtIndex:indexPath.row];
                                     [tableView reloadData];
                                 }
                                 ];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                         style:UIAlertActionStyleCancel

                                                       handler:nil];
        [alert addAction:delete];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
        [tableView reloadData];
    }
}

#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    CityDetailViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    CityDetail *selectedCity = [self.cityArray objectAtIndex:rowNumber];
    vc.theCity = selectedCity;
    vc.navigationItem.title = selectedCity.cityName;
    
}



@end
