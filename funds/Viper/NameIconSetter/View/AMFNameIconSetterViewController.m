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
    NSIndexPath *_selectedPath;
    NSString *_labelName;
    BOOL _hideIcons;
}
@property (weak, nonatomic) IBOutlet UITextField *categoryName;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation AMFNameIconSetterViewController

@synthesize name,
iconset,
icon;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

    switch (self.iconset) {
        default:
        case 0:
            _icons = [NSArray arrayWithObjects:kPossibleIcons count:sizeof(kPossibleIcons)/sizeof(kPossibleIcons[0])];
            break;

        case kIconForWallet:
            _icons = [NSArray arrayWithObjects:kIconsForWallet count:sizeof(kIconsForWallet)/sizeof(kIconsForWallet[0])];
            break;
    }
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

    if (_hideIcons) {
        self.tableView.hidden = YES;
        self.iconLabel.hidden = YES;
    }

    if (_labelName)
        self.nameLabel.text = _labelName;
}

- (void)refreshContents {
    self.categoryName.text = self.name;
    _icon_selected = self.icon;
    NSInteger index = [_icons indexOfObject:_icon_selected];
    if (index >= 0 && index < _icons.count) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    }
}

- (void)hideIconTable {
    _hideIcons = YES;
}

- (void)changeNameLabel:(NSString*)n {
    _labelName = n;
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
    if ([_icons[indexPath.row] isEqualToString:_icon_selected]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        _selectedPath = indexPath;
    }
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *old = nil;
    if (_selectedPath)
        old = _selectedPath;
    _icon_selected = _icons[indexPath.row];
    _selectedPath = indexPath;
    NSArray *indexes = [NSArray arrayWithObjects:indexPath, old, nil];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:indexes withRowAnimation:NO];
    [self.tableView endUpdates];
}

@end
