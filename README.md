# BSNumbers

## Installation

> pod 'BSNumbers', '~> 0.0.4'

## Usage

### Supple an array with models as datasource

    NSArray<NSDictionary *> *flightsInfo = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flightsInfo" ofType:@"plist"]];
    NSMutableArray<Flight *> *flights = @[].mutableCopy;
    for (NSDictionary *flightInfo in flightsInfo) {
        Flight *flight = [[Flight alloc]initWithDictionary:flightInfo];
        [flights addObject:flight];
    }
    
### This is the model: Flight

    @interface Flight : NSObject

    @property (strong, nonatomic) NSString *company;
    @property (strong, nonatomic) NSString *number;
    @property (strong, nonatomic) NSString *typeOfAircraft;
    @property (strong, nonatomic) NSString *date;
    @property (strong, nonatomic) NSString *placeOfDeparture;
    @property (strong, nonatomic) NSString *placeOfDestination;
    @property (strong, nonatomic) NSString *departureTime;
    @property (strong, nonatomic) NSString *arriveTime;
    @property (strong, nonatomic) NSString *price;

    - (instancetype)initWithDictionary:(NSDictionary *)dic;

    @end

###Set the datasource and the other optional attribute

    self.numbersView.bodyData = flights;
    
######optional attribute

    self.numbersView.headerData = @[@"Flight Company", @"Flight Number", @"Type Of Aircraft", @"Date", @"Place Of Departure", @"Place Of Destination", @"Departure Time", @"Arrive Time", @"Price"];
    self.numbersView.freezeColumn = 1;
    self.numbersView.bodyFont = [UIFont systemFontOfSize:14];
    
###Display

    [self.numbersView reloadData];
