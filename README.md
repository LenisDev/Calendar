![Project Logo](./Logo.png)

![License MIT](https://img.shields.io/github/license/LenisDev/Calendar)
![CI Tests](https://github.com/LenisDev/Calendar/workflows/GHActionCI/badge.svg)
![Carthage compatibility](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat")
![pod](https://img.shields.io/cocoapods/v/CustomCalendar.svg)
![Plateform compatibility](https://img.shields.io/cocoapods/p/CustomCalendar)

- [Overview](#overview)
- [Usage](#usage)
- [Installation Guide](#installation-guide)
- [Full Documentation](https://lenisdev.github.io/Calendar/index.html)
- [Contribute](#contribute)

### Overview
Easy to use functional calendar for iOS projects.

### Usage
```swift

  // Step 1 - create
  let calendarView = CalendarView(data: CalendarViewModel()) {[weak self] (selectedDay) in
      print(selectedDay)
  }
    
  // Step 2: Customize
  calendarView
      .style(RectShapeStyle())
      .state(.expanded)
      .itemUnselectedStyle(CapsuleShapeStyle())
      .itemSelectedStyle(CapsuleBorderStyle())
      
```

<br>

### Installation Guide

#### Carthage

Step 1: 
Add following to your CartFile

```
github "LenisDev/Calendar" ~> 0.0.1
```

Step 2:
run `carthage update` from current project directory.

*That's all, you have it installed.*

<br>

#### CocoaPods

Step 1:
Add `pod 'CustomCalendar', '~> 0.0.1'` to your Podfile:

```
target 'MyApp' do
  pod 'CustomCalendar', '~> 0.0.1'
end
```

Step 2:
run `pod install` from current project directory.

*That's all, you have it installed.*

<br>

>
>
>Try it using following command
>```
>pod try Tab
>```
>

<br>

#### Swift Package Manager
```
dependencies: [
    .package(url: "https://github.com/LenisDev/Calendar.git", .upToNextMajor(from: "0.0.1"))
]
```

<br>

### Contribute
> - Play around and report bugs
> - Fix issues and create PR
> - Add documentations and new features
