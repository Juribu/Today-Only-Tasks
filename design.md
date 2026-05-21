Design by Stitch:

<img width="687" height="503" alt="Screenshot 2026-05-20 at 10 48 08 PM" src="https://github.com/user-attachments/assets/99d1b042-dc93-44ca-88f7-0e077ea13f13" />


Prompt to Sitch:

Following Apple's Human interface Guideline and liquid screen.

## The App

Build a small iOS todo/reminder app with one central constraint:

The app only cares about today.

* Tasks belong to the current day
* Tasks expire at the end of the day
* Each new day starts with a clean slate
* There are intentionally no future dates, backlogs, or overdue tasks

This constraint is intentional and should guide your product and technical decisions.

---

## Must-Have Features

### 1. Today-Only Tasks

* Users can add tasks for the current day
* Tasks from previous days are not shown
* Expiration happens automatically (no manual cleanup required)

### 2. Task Interaction

* Add a task
* Mark a task as complete

### 3. Automatic Day Reset

* When a new day begins, old tasks should no longer appear in the main list

---

### UX / UI

* Option to set a task expiration time (same day only)
* Option to see previously expired todos

## Out of Scope

To keep the exercise focused and fair, please do not implement:

* User accounts or authentication
* Scheduling tasks for future days
* Complex settings screens
