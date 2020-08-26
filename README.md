# Calendar
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
