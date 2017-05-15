# Meeting-Planner

# Problem Statement
You are in charge of assigning meeting rooms at your company. Especially many meetings
have been planned for next Thursday, so you decided to write a program to help you fit the
meetings within your time constraints.

* There are 2 meeting rooms
* The meetings have to be scheduled during core work hours (09:00 - 17:00)
* No meetings can be scheduled during lunchtime (12:00 - 13:00)
* Meetings at your company never overrun and can be scheduled back-to-back, with no gaps in between them
* Apart from these constraints, meetings can be placed anywhere, and the duration of
gaps between them doesn't matter.

The input contains one meeting per line; the meeting title can contain any characters and is
followed by a space and the meeting duration, which is always given in minutes. Since multiple
meeting configurations are possible, the test output given here is only one of the possible
solutions, and your output doesn't have to match it as long as it meets all constraints.

# Algorithm

The algorithm iterates over the meetings list, pick one by one and adds its to the meeting room by differentiating between morning and afternoon session

1.Create 2 empty rooms
2.Pick up a meeting
3.If total length + meeting length < morning session time, append to Room and return to (2), else
4.If total length + meeting length < afternoon session time, append to Room and return to (2), else
5.Iterate over Meetings except the scheduled ones
6.Repeat steps 2 to 4 for Room 2

# How to Run
ruby lib/main.rb input_1.txt

# Output
Room 1
09:00 AM All Hands meeting 60
10:00 AM Marketing presentation 30
10:30 AM Product team sync 30
11:00 AM Ruby vs Go presentation 45
12:00 PM Lunch
01:00 PM New app design presentation 45
01:45 PM Customer support sync 30
02:15 PM Front-end coding interview 60
03:15 PM Skype Interview A 30
03:45 PM Skype Interview B 30
04:15 PM Project Bananaphone Kickoff 45

Room 2
09:00 AM Developer talk 60
10:00 AM API Architecture planning 45
10:45 AM Android app presentation 45
11:30 AM New marketing campaign presentation 30
12:00 PM Lunch
01:00 PM Back-end coding interview A 60
02:00 PM Back-end coding interview B 60
03:00 PM Back-end coding interview C 60
04:00 PM Sprint planning 45

# Tests
rpsec
Finished in 0.06361 seconds (files took 0.97414 seconds to load)
8 examples, 0 failures