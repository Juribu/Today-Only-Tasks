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

# AI Usage Summary 
[conversation history](https://github.com/Juribu/Today-Only-Tasks/blob/main/TodayTasks/CluadeChatCombined.txt)

I defined the architecture and made key decisions myself, I my prompts were mostly structured like this:

Write ...., I already have ... so don't worry about ..., include:
1. in aView, do this
2. in bView, do this
3. in cView, do this

Thinigs I had to correct:
- I pushed back when AI wrote new logic in the view that could have just reused existing logic. For example, the vm we already have expiredPreviousDays, and Claude tried to rederive the logic in ExpiredTaskRowView, I told it the check was already checked in vm and use it
- I reviewed the logic for filtering tasks, and corrected claude codes logic when it went wrong. For example: it filtered expired tasks without a same day check, which would have put all expired tasks from past days in the TodayView, I manually corrected those kind of mistakes and stay aware of these logic errors.
