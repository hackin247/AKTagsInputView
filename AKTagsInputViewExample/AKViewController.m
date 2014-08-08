//
//  AKViewController.m
//  AKTagsInputViewExample
//
//  Created by Andrey Kadochnikov on 01.06.14.
//  Copyright (c) 2014 Andrey Kadochnikov. All rights reserved.
//
#import "AKTagsDefines.h"
#import "AKTagsInputView.h"
#import "AKViewController.h"

@interface AKViewController ()

@property (weak, nonatomic) IBOutlet AKTagsInputView *tagsInputView;

@end

@implementation AKViewController

#pragma mark - This is what you are looking for:

- (void)setTagsInputView:(AKTagsInputView *)tagsInputView
{
    _tagsInputView = tagsInputView;
    
	_tagsInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	_tagsInputView.lookupTags = @[@"ios", @"iphone", @"objective-c", @"development", @"cocoa", @"xcode", @"icloud"];
	_tagsInputView.selectedTags = [NSMutableArray arrayWithArray:@[@"some", @"predefined", @"tags"]];
	_tagsInputView.enableTagsLookup = YES;
}

-(void)btnPressed:(id)sender
{
	[[[UIAlertView alloc] initWithTitle:@"Selected tags" message:[_tagsInputView.selectedTags componentsJoinedByString:@", "] delegate:nil cancelButtonTitle:@"Nice!" otherButtonTitles: nil] show];
}
-(void)clearInputView
{
	[_tagsInputView clear];
}

#pragma mark - some other UI stuff
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = WK_COLOR(200, 200, 200, 1);
	[self.view addSubview:[self createLabel]];
	[self.view addSubview:[self createButton]];
	[self.view addSubview:[self clearButton]];
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

-(UIButton*)createButton
{
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_tagsInputView.frame)+15, 290, 44)];
	[btn setTitle:@"Display selected tags" forState:UIControlStateNormal];
	btn.titleLabel.font = AVENIR_NEXT(17);
	[btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
	return btn;
}
-(UIButton*)clearButton
{
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_tagsInputView.frame)+15+44+15, 290, 44)];
	[btn setTitle:@"Clear field" forState:UIControlStateNormal];
	btn.titleLabel.font = AVENIR_NEXT(17);
	[btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(clearInputView) forControlEvents:UIControlEventTouchUpInside];
	return btn;
}
-(UILabel*)createLabel
{
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 55, 290, 24)];;
	label.textAlignment = NSTextAlignmentLeft;
	label.text = @"TAGS";
	label.font = AVENIR_NEXT(14);
	return label;
}
@end
