![Project Logo](./Logo.png)
Easy to use functional calendar for iOS projects.

![CI Tests](https://github.com/LenisDev/Calendar/workflows/GHActionCI/badge.svg)

- [Usage](#usage)
- [Full Documentation](https://lenisdev.github.io/Calendar/index.html)

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
