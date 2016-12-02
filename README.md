#GDPerformanceView
Shows FPS, CPU usage, app and iOS versions above the status bar.

![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view.PNG?raw=true "Example PNG")
![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view_2.PNG?raw=true "Example PNG")
![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view_3.PNG?raw=true "Example PNG")
![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view_4.PNG?raw=true "Example PNG")

## Installation
Simply add GDPerformanceMonitoring folder with files to your project, or use CocoaPods.

### Podfile
```
platform :ios, '8.0'
use_frameworks!

target 'project_name' do
	pod 'GDPerformanceView', '~> 1.0.9'
end
```

## Usage

Simply start monitoring. Performance view will be added above the status bar automatically.
Also, you can configure appearance as you like.

### Start monitoring

Call to start or resume monitoring and show monitoring view.

```
[[GDPerformanceMonitor sharedInstance] startMonitoring];
```

or

```
self.performanceMonitor = [GDPerformanceMonitor alloc] init];
[self.performanceMonitor startMonitoring];
```

### Stop monitoring

Call when you're done with performance monitoring.

```
[self.performanceMonitor stopMonitoring];
```

Call to hide and pause monitoring.

```
[self.performanceMonitor pauseMonitoring];
```

### Configuration

```
[self.performanceMonitor configureWithConfiguration:^(UILabel *textLabel) {
	[textLabel setBackgroundColor:[UIColor blackColor]];
	[textLabel setTextColor:[UIColor whiteColor]];
	[textLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
}];
```
```
[self.performanceMonitor setAppVersionHidden:YES]
```
```
[self.performanceMonitor setDeviceVersionHidden:YES];
```

### Start monitoring and configure

```
[self.performanceMonitor startMonitoringWithConfiguration:^(UILabel *textLabel) {
	[textLabel setBackgroundColor:[UIColor blackColor]];
	[textLabel setTextColor:[UIColor whiteColor]];
	[textLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
}];
```

## Requirements
- iOS 8.0+

## License
GDPerformanceView is available under the MIT license. See the LICENSE file for more info.
