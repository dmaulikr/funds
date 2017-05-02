//
//  AMFEditCategoryViewController.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryViewController.h"

#import "AMFEditCategoryViewOutput.h"
#import "AMFCategoryProtocol.h"

NSString *const kIconCatCellIndentifier = @"iconCategoryCell";

@interface AMFEditCategoryViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *_icons;
    NSString *_icon_selected;
}

@property (weak, nonatomic) IBOutlet UITextField *categoryName;


@end

@implementation AMFEditCategoryViewController

@synthesize category;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	_icons = [NSArray arrayWithObjects:kPossibleIcons count:sizeof(kPossibleIcons)/sizeof(kPossibleIcons[0])];
	_icon_selected = _icons[0];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы AMFEditCategoryViewInput

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
    self.categoryName.text = category.name;
    _icon_selected = category.icon_path;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIconCatCellIndentifier];
    cell.imageView.image = [UIImage imageNamed:_icons[indexPath.row]];
    cell.textLabel.text = _icons[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _icon_selected = _icons[indexPath.row];
}

@end
