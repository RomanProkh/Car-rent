# Car rent

Web development course project that has been created in a short time. The Project's goal was to practice Vue.js, Express.js and Robot Framework technologies. 
This project will be developed further later on (including testing, new functionalities etc).

## What is it all about

This project allows users to rent a car. All the information about cars, orders etc. is stored in the database. Main website gets and sends the information through a self made api. 

## Installation

First you need to install all modules listed in dependencies **api/package.json** and **main/package.json.** (Default node command is ***npm install***) 
Then you need to run **api/server.js** file by executing command ***node server.js***
Execute ***npm run serve*** command from directory **/main** 
Setup **server.js** file so that it can find your DB. My database dump is in file called **car_rent.sql** that can be found from this repository.

### Testing

Testing is made with Robot Framework(POM design pattern) and its library selenium. Installation instruction can be found [here](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions)  
This project is not fully tested, and it will be improved later on. 
Testing files can be found in the testing folder. 

## Some screenshots
<div style="flow:left">
<img src="https://github.com/RomanProkh/Car-rent/blob/main/screenshots/1.png" alt="Main Page" width="500"/>
<img src="https://github.com/RomanProkh/Car-rent/blob/main/screenshots/2.png" alt="Main Page" width="500"/>
</div>
<div style="flow:left">
<img src="https://github.com/RomanProkh/Car-rent/blob/main/screenshots/3.png" alt="Main Page" width="500"/>
<img src="https://github.com/RomanProkh/Car-rent/blob/main/screenshots/4.png" alt="Main Page" width="500"/>
</div>
