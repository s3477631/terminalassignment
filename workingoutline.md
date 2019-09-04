**Gym/Exercise Terminal App**



Accessibility features: text to speech



**Data-Structure**

Folder Structure:

User\_Profiles:

 Name, Weight, Age, Height, Created At,

Workouts:

Name, intensity, duration, category, instructions
Nutrition\_plan:

Name, ingredients, duration\_to\_make, category: \&lt;options\&gt; Build muscle, lean muscle, loss weight

User\_TrackedData:

 Subtly records user options (i.e. if nutrition plan or workouts is selected) only asking to record weight today… notes, nutrition plan and work-outs can be added optionally.

**Features**

**Markdown-Cheatsheet**

[https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

Small, medium, large (for user story - timeframe)

1. Record work out session to file/command line
2. Compare set goals to recorded values
3. Record food intake
4. Meal plan output

**Gems**

Fileutils.mkdir\_p () - create directory cd and touch todaysentry.rb (built in)

Faker - random inspirational quotes (write custom inspirational quotes) (to get)

Umbra - gui forms, validation, etc (built badly on-top of ncurses)
Ncurses for sound







**Classes**

1. Class User\_Profile(name, age - derived value, weight, sex, bmi, height)

 Sign in by specifying path &amp;&amp; document (use environment variables to store a   default path and file)

Methods:

Check if profile is saved in directory,
Else

Create new profile: age, weight, sex

- --Access age, name and weight from user profile… if no file is available: &quot;Setup User Profile&quot;
- --&quot;Remove User Profile&quot;

 2. Class Workouts(workout\_category, workout\_name, workout\_details) \&lt; User\_Profile

Workout\_category = full\_routine/slice

Key-value-pair structure

Methods:

Add\_workout

Remove\_workout

Display\_workput

 3. Class BMI(weight, height)

Calculate &amp; output BMI

Key-value pair to create hash of paths and alias&#39;es



**Alternative framework:**

Trailblazer: [**https://github.com/trailblazer/trailblazer**](https://github.com/trailblazer/trailblazer)