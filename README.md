# Open Online Introduction to R Course

## General Information

<table>
<tr>
   <td>Course Dates</td>
   <td>2-3 April, 2020</td>
</tr>
<tr>
   <td>Course Times</td>
   <td>9:00 - 17:00 CEST (UTC/GMT+2) (<a href="https://www.timeanddate.com/worldclock/fixedtime.html?iso=20200402T090000&p1=1307">check local time</a>)
</tr>
<tr>
   <td>Course Location</td>
   <td>online / <a href="https://www.twitch.tv/wviechtb">live stream</a></td>
</tr>
<tr>
   <td>Registration</td>
   <td>not necessary</td>
</tr>
<tr>
   <td>Course Fee</td>
   <td>none (this course is free!)</td>
</tr>
</table>

## General Information

R is a programming language and software environment for carrying out computations, manipulating and analyzing data, and creating various types of plots and graphics (see the [R project website](https://www.r-project.org/) for more info). R has become the 'lingua franca of statistics' and the software of choice for analyzing data in various disciplines. However, for many researchers, getting up and running with R remains a hurdle due to the command-driven nature of the software. The purpose of this course is to lay the necessary foundation for becoming a proficient R user.

In this course, we will cover:

* a bit of history and the development of R
* how to use and interact with R
* basic data structures
* data import and export
* data inspection and manipulation
* methods for graphing data
* t-tests and analysis of (co)variance
* linear regression
* categorical data analysis and logistic regression
* add-on packages (how to find, install, and work with them)
* how/where to obtain help when you get stuck
* basic programming structures (e.g., loops, if-else statements)
* writing documents with R Markdown
* and depending on time and interest various miscellaneous topics:
  * how R 'works' (functions, classes, methods, oh my!)
  * psychometrics (reliability and factor analysis)
  * merging datasets
  * working with 'long format' datasets
  * multilevel / mixed-effects models
  * survival analysis and Cox models
  * non-parametric methods
  * string manipulations
  * ...

**Note:** When discussing statistical methods/models, emphasis will be on the general syntax as used in R and less on the statistical details of the various procedures (i.e., this is not a 'stats' course, it is a 'how to do stats with R' course). Hence, some familiarity with basic statistical concepts and methods is helpful when following the course.

The course is aimed at researchers, (Master and PhD level) students, data analysts/scientist, and essentially anybody interested in learning how to work with R.

## Course Schedule

**Note**: This schedule is tentative. The starting and ending times of the course are quite definite, but everything in between is subject to change. Also, shorter breaks are not explicitly indicated in the schedule below, but will happen throughout the days (essentially between each topic).

#### Day 1

| Time        | Topic                |
| ----------- | -------------------- |
| 09:00-10:00 | Introductory Lecture |
| 10:00-11:00 | Interacting with R |
| 11:00-12:00 | Basic Data Structures |
| 12:00-13:00 | Break |
| 13:00-14:00 | Working with Data Frames |
| 14:00-15:30 | Importing and Inspecting Data |
| 15:30-17:00 | Basic and Some Advanced Plotting |

#### Day 2

| Time        | Topic                |
| ----------- | -------------------- |
| 09:00-11:00 | Statistics with Continuous Outcomes |
| 11:00-12:00 | Statistics with Categorical Outcomes |
| 12:00-13:00 | Break |
| 13:00-14:00 | Working with R Packages |
| 14:00-15:00 | Programming Structures |
| 15:00-16:00 | R Markdown |
| 16:00-17:00 | Misc / Q&A |

## Course Format

The course will be taught online as a live stream via the streaming platform Twitch. Once the stream goes live (around 8:45 on each course day), simply go to [this link](https://www.twitch.tv/wviechtb) to start watching.

After an introductory lecture, the format of the course will be quite simple: I will provide you with R code that we will then go through step-by-step. Along the way, I'll explain how things work and answer questions as necessary. The code will be posted on the [course website](http://www.wvbauer.com/doku.php/course_oor#r_code) (and on [GitHub](https://github.com/wviechtb/course_oor/tree/master/code) and [GitLab](https://gitlab.com/wviechtb/course_oor/-/tree/master/code)). I provide the code at several locations to create some redundancy in case one of the links becomes inaccessible.

## How to Prepare for the Course

You will need a computer with the current version of R installed. You can download R from the [Comprehensive R Archive Network](https://cran.r-project.org/) (CRAN). Follow the appropriate "Download R" link depending on your operating system (OS) and follow the instructions for downloading and installing R. If you already have R installed, please check that it is the current (or a relatively current) version (you can check what the 'latest release' of R is by going to [CRAN](https://cran.r-project.org/)). If not, please update.

Although not strictly necessary, it will be useful to also install an integrated development environment (IDE) for R. A popular choice these days is RStudio. So, unless you already have a different setup, download the appropriate installer of RStudio for your OS from [here](https://rstudio.com/products/rstudio/download/#download) and install in the usual manner.

You do not need to have a Twitch account to watch the stream, but if you would like to post comments or questions via the chat (see below), then you do need to be signed in. To create an account, go to [Twitch](https://www.twitch.tv/), click on "Sign Up", and follow the instructions. Make sure you also verify your email address as part of the registration procedure (otherwise you cannot use the chat).

You might also want to think a bit ahead of time how you will arrange your desktop while following the course. You will want to have both your browser (for following the live stream) and R/RStudio open at the same time and ideally put them side-by-side (otherwise, you will have to switch back and forth between these windows, which will become tedious rather quickly). So, unless you have a large monitor, two computers/monitors (i.e., one for the stream, one for R/RStudio) would be ideal.

~~Just as an idea, you could also consider following the course together with other people as a group and set up a computer/projector to show the stream, while everybody can work on their own computer/laptop to follow along~~ (scratch that; this is not a good idea at the moment).

## Chat (Purpose and Rules)

Usually, I teach courses 'in person' and there are various benefits from being in the same room as the course participants. For one thing, if I see a lot of confused faces, it tells me to slow down or reexplain things. The chat will have to replace this form of communication. If something is unclear, just let me know via the chat.

If possible, I will also be happy to answer 'but how do I do this or that?' type questions (assuming they relate to what is being covered in the course at that moment). However, if there are too many questions of this type at the same time, the chat will become unusable, so please consider carefully whether it is appropriate to ask such questions at particular moments.

Note that there is a slight delay when live streaming (between a few and sometimes up to 10-20 seconds), so keep that in mind when asking questions. This can also make 'back-and-forth' questioning difficult (e.g., if I have to ask for some clarification about your question).

Any type of harassment or hateful conduct, inappropriate commenting, or disruptive behavior will not be tolerated and will lead to temporary chat timeouts or to being banned from the chat permanently.

## Other Things / Notes / FAQs

Some other notes and frequently asked questions that may come up:

* While I have a lot of experience teaching courses 'in person', this will be the first time I am teaching a course in this format. Please be gentle if things don't go completely smoothly the first time around.

* In the 'in person' courses that I teach, I often end up troubleshooting some general computer problems for one or multiple course participants. I will not be able to do this in this course. I also cannot provide statistical support or answer questions you have about your own data analysis needs.

* I reserve the option to end the course at any point (e.g., due to low attendance, technical problems). Also, depending on how things go (e.g., if there are technical problems, lots of questions), I might not be able to cover all topics planned.

* If, for whatever reason, the stream goes down (and I cannot reconnect and get it running again), I will post a note at the top of this page.

* I cannot provide 'course certificates' or some other form of certification that you have participated in the course.

* The stream will not be recorded. The whole point is that this is an interactive live stream, which sets it apart from online courses that use pre-recorded videos or any of the thousands of YouTube videos that teach R. If I wanted to create the latter, I would script the entire video (which is not compatible with the dynamics of an interactive live stream) and would have to do a lot of post-processing.

* Related to the previous point: I understand that the course will primarily target those in timezones with small deviations from UTC/GMT (i.e., Europe and Africa). If the course is well received, I will consider repeating the course and then starting it in the afternoon (my local time), so that people from North/South America can more easily attend.

* And related to the previous point: The course starts each day at 9:00 CEST (which is UCT/GMT+2). To figure out what the start time will be in your own timezone, you can go [here](https://www.timeanddate.com/worldclock/fixedtime.html?iso=20200402T090000&p1=1307).

* For people affiliated with Maastricht University: You might want to consider following the [Introduction to R Course](https://www.maastrichtuniversity.nl/education/introduction-r) I teach for the university (high attendance / interest in this course shows the university the importance of keeping the course in its curriculum and you also get the benefits from 'in person' interactions).

## Relevant Links

The following are relevant links for the course itself:

* [Stream at Twitch](https://www.twitch.tv/wviechtb)
* [Chat Only](https://www.twitch.tv/popout/wviechtb/chat) (in case you have another computer showing the stream, but want to ask questions)
* [Code on Course Website](http://www.wvbauer.com/doku.php/course_oor#r_code)
* [Code on GitHub](https://github.com/wviechtb/course_oor/tree/master/code)
* [Code on GitLab](https://gitlab.com/wviechtb/course_oor/-/tree/master/code)
* [Pre-Course Questionnaire](https://forms.gle/s9wwmsN83gs1jEPk6)

The following are relevant links in general:

* [R Project Website](https://www.r-project.org/)
* [CRAN Website](https://cran.r-project.org/)
* [RStudio Website](https://www.rstudio.com/)
* [Cross Validated](https://stats.stackexchange.com/tour)
* [Stack Overflow](https://stackoverflow.com/tour)

## License

The contents of this repo are licensed under the following license: [CC Attribution-Noncommercial-Share Alike 4.0 International](http://creativecommons.org/licenses/by-nc-sa/4.0/).
