//
//  AMFNameIconSetterViewController.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterViewController.h"

#import "AMFNameIconSetterViewOutput.h"

static NSString *const kIconCellIndentifier = @"iconCell";

@interface AMFNameIconSetterViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *_icons;
    NSString *_icon_selected;
}
@property (weak, nonatomic) IBOutlet UITextField *categoryName;
@end

@implementation AMFNameIconSetterViewController

@synthesize name, icon;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	_icons = [NSArray arrayWithObjects:kPossibleIcons count:sizeof(kPossibleIcons)/sizeof(kPossibleIcons[0])];
	_icon_selected = _icons[0];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Methods of AMFNameIconSetterViewInput

- (void)setupInitialState {
    if (!self.navigationItem.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"done"]
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(done)];
        self.navigationItem.rightBarButtonItem = done;
    }
}

- (void)refreshContents {
    self.categoryName.text = self.name;
    _icon_selected = self.icon;
}

#pragma mark - Themes

- (void)applyTheme {
    [super applyTheme];
}

#pragma mark - Actions

- (void)done {
    [self.output doneEditingWithName:self.categoryName.text andIcon:_icon_selected];
}

#pragma mark - Table View source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _icons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIconCellIndentifier];
    cell.imageView.image = [UIImage imageNamed:_icons[indexPath.row]];
    cell.textLabel.text = _icons[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _icon_selected = _icons[indexPath.row];
}

@end
