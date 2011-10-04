//
//  PhotoGridController.m
//  ImageGallery
//
//  Created by Роман Романчук on 04.10.11.
//  Copyright 2011 Epam. All rights reserved.
//

#import "PhotoGridController.h"
#import "SCImageCollectionViewItem.h"

@implementation PhotoGridController

@synthesize btn = _btn;

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.collectionView.extremitiesStyle = SSCollectionViewExtremitiesStyleScrolling;
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, 75, 35);    
    [_btn setBackgroundImage:[UIImage imageNamed:@"btn_edit.png"] forState:UIControlStateNormal];
    [_btn setTitle:@"Edit" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(switchBetweenEditMode:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:_btn];
	self.navigationItem.rightBarButtonItem = button;
	[button release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
	return YES;
}


#pragma mark -
#pragma mark SSCollectionViewDataSource

- (NSUInteger)numberOfSectionsInCollectionView:(SSCollectionView *)aCollectionView {
	return 1;
}


- (NSUInteger)collectionView:(SSCollectionView *)aCollectionView numberOfItemsInSection:(NSUInteger)section {
	return 5;
}


- (SSCollectionViewItem *)collectionView:(SSCollectionView *)aCollectionView itemForIndexPath:(NSIndexPath *)indexPath {
	static NSString *const itemIdentifier = @"itemIdentifier";
	
	SCImageCollectionViewItem *item = (SCImageCollectionViewItem *)[aCollectionView dequeueReusableItemWithIdentifier:itemIdentifier];
	if (item == nil) {
		item = [[[SCImageCollectionViewItem alloc] initWithReuseIdentifier:itemIdentifier] autorelease];
	}	
//	CGFloat size = 80.0f * [[UIScreen mainScreen] scale];
//	NSInteger i = (50 * indexPath.section) + indexPath.row;
	
	return item;
}

/*
- (UIView *)collectionView:(SSCollectionView *)aCollectionView viewForHeaderInSection:(NSUInteger)section {
    return nil;
	SSLabel *header = [[SSLabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 40.0f)];
	header.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	header.text = @" ";
    //[NSString stringWithFormat:@"Section %i", section + 1];
	header.textEdgeInsets = UIEdgeInsetsMake(0.0f, 19.0f, 0.0f, 19.0f);
	header.shadowColor = [UIColor whiteColor];
	header.shadowOffset = CGSizeMake(0.0f, 1.0f);
	header.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
	return [header autorelease];
}*/


#pragma mark -
#pragma mark SSCollectionViewDelegate

- (CGSize)collectionView:(SSCollectionView *)aCollectionView itemSizeForSection:(NSUInteger)section {
	return CGSizeMake(80.0f, 80.0f);
}

/*
- (void)collectionView:(SSCollectionView *)aCollectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSString *title = [NSString stringWithFormat:@"You selected item %i in section %i!",
					   indexPath.row + 1, indexPath.section + 1];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil
										  cancelButtonTitle:@"Oh, awesome!" otherButtonTitles:nil];
	[alert show];
	[alert release];
}*/


- (CGFloat)collectionView:(SSCollectionView *)aCollectionView heightForHeaderInSection:(NSUInteger)section {
	return 40.0f;
}

-(void)switchBetweenEditMode:(UIBarButtonItem *)sender {
    if (sender.tag == 0) {
        sender.tag = 1;
        [self.btn setTitle:@"Done" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        [self.btn setTitle:@"Edit" forState:UIControlStateNormal];
    }
}
@end
