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
