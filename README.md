# Today-Only-TasKS

# overall approach

1. Identified what are needed and architect the directory structure (Model/View/ViewModel/Persistence)
2. Started with creating Task Model
3. Then set up local persistence
4. Built the ViewModel and the Business logic
5. Laid out the basic UI
6. Hook up business logic to UI
## Optional enhancements
7. Set up noification for firing notifs before the end of day
8. Enhance UI: Haptic feedback
9. Celebration for competion
10. Polish UI such as displaying dates, and "expiring soon" badge and expiration time

# Key decisions or tradeoffs
- I chosed Codable JSON local file storage for persistence because the required minimum deployment is iOS 16, this ruled out SwiftData which required iOS 17, between Codable JSON and CoreData, I went with file because CoreData's complexity and overhead would be an overkill for a single feature app, if I spend more time on this, I would add swiftData with #available check for iOS 17+ while keeping file store for iOS 16 users.
- I set up a TaskStore protocol so my ViewModel communicates with the persistence layer through TaskStore, so if I end up adding SwiftData, I wouldn't have to change the logic in my ViewModel.


# What would you improve with more time
- With more time, I would set up SwiftData for iOS 17 and above
- I would also show precise date for previous expiration dates instead of just "expired previous day"
- Add a homescreen widget

# Anything you got stuck on and how you worked through it
- I got stuck when XCode threw me an error related @StateObject ownership, I instantiated the viewModel in the App file, but I also delcared it as a private @StateObject in root contentView, which XCode would instantiated a second time, I quickly realized that it should be a non private @ObservedObject in contentView, since it was already instantiated upstream in the Root App. So I resolved it with the rule of making that viewModel a @StateObject in the App file for single ownership and injecting it everywhere as @ObservedObject.
