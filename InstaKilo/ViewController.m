//
//  ViewController.m
//  InstaKilo
//
//  Created by Jeff Huang on 2015-07-16.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import "ViewController.h"
#import "InstaKiloCollectionViewCell.h"
#import "InstaKilo.h"
#import "HeaderCollectionReusableView.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray* objects;
@property (nonatomic) NSMutableArray* objectsSortBySubject;
@property (nonatomic) NSMutableArray* objectsSortByLocation;
@property (nonatomic) IBOutlet UICollectionView* instaKiloCollectionView;
@property (nonatomic) IBOutlet UISegmentedControl *segControl;

@end

@implementation ViewController
@synthesize segControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.objects = [[NSMutableArray alloc] init];
    self.objectsSortBySubject = [[NSMutableArray alloc] init];
    self.objectsSortByLocation = [[NSMutableArray alloc] init];
    
    //by default use sort by subject
    self.objects = self.objectsSortBySubject;
    
    [self initSetup];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return [self.objects[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.objects count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //InstaKiloCollectionViewCell *cell = [[InstaKiloCollectionViewCell alloc] init];
    InstaKiloCollectionViewCell *cell = [self.instaKiloCollectionView dequeueReusableCellWithReuseIdentifier:@"instaKiloCell" forIndexPath:indexPath];
    InstaKilo *object = self.objects[indexPath.section][indexPath.row];
    [cell setCell:object withSegIndex:self.segControl.selectedSegmentIndex];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        HeaderCollectionReusableView *headerView = [self.instaKiloCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHeader" forIndexPath:indexPath];
        InstaKilo *temp = self.objects[indexPath.section][0];
        if(self.segControl.selectedSegmentIndex == 0)
            headerView.labelHeader.text = temp.subject;
        else
            headerView.labelHeader.text = temp.location;
        
        return headerView;
    }
    return nil;
}

#pragma customFunction

- (void)Insert:(InstaKilo*)ik{
    if (self.objectsSortBySubject.count > 0){
        BOOL found = NO;
        for (int j = 0; j < self.objectsSortBySubject.count; j++) {
            InstaKilo *temp = self.objectsSortBySubject[j][0];
            if ([temp.subject isEqualToString:ik.subject] && !found) {
                [self.objectsSortBySubject[j] insertObject:ik atIndex:0];
                found = YES;
            }
        }
        if (!found) {
            [self.objectsSortBySubject addObject:[[NSMutableArray alloc] initWithObjects:ik, nil]];
        }
    }
    else
        [self.objectsSortBySubject addObject:[[NSMutableArray alloc] initWithObjects:ik, nil]];
    //Insert for Location
    if (self.objectsSortByLocation.count > 0){
        BOOL found = NO;
        for (int j = 0; j < self.objectsSortByLocation.count; j++) {
            InstaKilo *temp = self.objectsSortByLocation[j][0];
            if ([temp.location isEqualToString:ik.location] && !found) {
                [self.objectsSortByLocation[j] insertObject:ik atIndex:0];
                found = YES;
            }
        }
        if (!found) {
            [self.objectsSortByLocation addObject:[[NSMutableArray alloc] initWithObjects:ik, nil]];
        }
    }
    else
        [self.objectsSortByLocation addObject:[[NSMutableArray alloc] initWithObjects:ik, nil]];
}

- (void)Insert:(InstaKilo*)ik withSegIndex:(NSInteger)segIndex{
    if (self.objects.count > 0){
        BOOL found = NO;
        for (int j = 0; j < self.objects.count; j++) {
            InstaKilo *temp = self.objects[j][0];
            if (segIndex == 0) {
                if ([temp.subject isEqualToString:ik.subject] && !found) {
                    [self.objects[j] insertObject:ik atIndex:0];
                    found = YES;
                }
            }
            else{
                if ([temp.location isEqualToString:ik.location] && !found) {
                    [self.objects[j] insertObject:ik atIndex:0];
                    found = YES;
                }
            }
        }
        if (!found) {
            [self.objects addObject:[[NSMutableArray alloc] initWithObjects:ik, nil]];
        }
    }
    else
        [self.objects addObject:[[NSMutableArray alloc] initWithObjects:ik, nil]];
}

- (IBAction)segmentSwitch:(id)sender{
    [self.instaKiloCollectionView reloadData];
    if (self.segControl.selectedSegmentIndex == 0) {
        self.objects = self.objectsSortBySubject;
    }
    else
        self.objects = self.objectsSortByLocation;
}

- (void)initSetup{
    NSMutableArray *initArray = [[NSMutableArray alloc] init];
    InstaKilo *ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"00.Ironman"]
                                          andSubject:@"Batch I"
                                         andLocation:@"Paris"];
    [initArray addObject:ik];
    
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"01.Ironman"]
                                          andSubject:@"Batch I"
                                         andLocation:@"Vancouver"];
    [initArray addObject:ik];
    
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"02.Ironman"]
                               andSubject:@"Batch I"
                              andLocation:@"Barcelona"];
    [initArray addObject:ik];
    
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"03.Ironman"]
                               andSubject:@"Batch II"
                              andLocation:@"Paris"];
    [initArray addObject:ik];
    
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"04.Ironman"]
                               andSubject:@"Batch II"
                              andLocation:@"Vancouver"];
    [initArray addObject:ik];
    
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"05.Ironman"]
                               andSubject:@"Batch II"
                              andLocation:@"Barcelona"];
    [initArray addObject:ik];
    
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"06.Ironman"]
                               andSubject:@"Batch III"
                              andLocation:@"Paris"];
    [initArray addObject:ik];
    ik = [[InstaKilo alloc] initWithImage:[UIImage imageNamed:@"07.Ironman"]
                               andSubject:@"Batch III"
                              andLocation:@"Vancouver"];
    [initArray addObject:ik];
    for(InstaKilo *ik in initArray)
        [self Insert:ik];
}

@end
