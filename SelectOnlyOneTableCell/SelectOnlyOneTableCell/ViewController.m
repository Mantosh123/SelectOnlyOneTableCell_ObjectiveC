//
//  ViewController.m
//  SelectOnlyOneTableCell
//
//  Created by Mantosh Kumar on 19/02/25.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.selectedIndexPath = nil;
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10; // Example number of rows
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", (long)indexPath.row];

    // Set selection style
    if ([indexPath isEqual:self.selectedIndexPath]) {
        cell.backgroundColor = [UIColor lightGrayColor]; // Highlight selected cell
    } else {
        cell.backgroundColor = [UIColor whiteColor]; // Reset others
    }

    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath isEqual:self.selectedIndexPath]) {
        // Deselect if the same cell is tapped again
        self.selectedIndexPath = nil;
    } else {
        // Store new selected index
        self.selectedIndexPath = indexPath;
    }

    // Refresh the table to apply changes
    [tableView reloadData];
}

@end
