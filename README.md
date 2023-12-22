# 2433-Database-Systems
This is a repository for the course Database Systems (CSCI-GA 2433) at the NYU.

## Project Demo Video: 
https://drive.google.com/drive/folders/1xjBEifMORZ6zA4jdlV1jv2ReRhV-jtMt?usp=drive_link

## Project Part 1 to Part 3
These file folders contain the materials we submitted to Brightspace according to the requirements of each project.

Since Zejun Zhang did the first three parts of this project solo, so his previous work is stored in a branch (zejzhang) of this git repository. 

## Project Part 4
We finalized the data-driven end-to-end web application in the part of project.

- Backend.ipynb: This notebook is used for the backend process, which contains collecting and parsing new data, connecting databases and the frontend, machine learning prediction, and replying results to the frontend.
- Web App.html: This is our frontend html file where we generate customers' data and show the prediction results on this interface. Two commands: Predict/Add. Predict: Base on existed training set, we give a result wheather the health insurance owner is interested in the vehicle insurance provided by the same insurance company. Add: Adding this customer's information into training set for the future prediction.
- Backend-test.ipynb: This notebook is a test file for the backend development.
- Data_Processing.ipynb: This notebook is used for processing the original input data to generate the training data and the test data for machine learning.
- database.sql: This is the MySQL database we set locally, it stores all the training data and test data for machine learning. This file is too large to be stored on Github repository, so we store it on google drive: https://drive.google.com/drive/folders/1xjBEifMORZ6zA4jdlV1jv2ReRhV-jtMt?usp=drive_link
- EmployeeController.java: This is an extension of our project, where we use Java Spring Boot and MyBatis Plus ORM to query the database for employee information. We demonstrate our understanding of ORM in this extension and it provides a direction for future further improvement.
- Data: This file folder contains the training data and the test data for machine learning.

## How to Use Our Web Application
If you want to test the web application, you should first download the database.sql and deploy locally. Then, you should run the Backend.ipynb locally, and do not forget to modify the database's path. Finally, you can open the web page and try our web application.

Here are some toy examples you can try:

1. Data Addition:
- `voice_input`: id is 351764, Gender is Male, Age is 71, Driving_License is 1, Region_Code is 46, Previously_Insured is 1, Vehicle_Age is one to two years, Vehicle_Damage is No, Annual_Premium is 2630, Policy_Sales_Channel is 30, Vintage is 32, Response is 0
- `command`: Add

2. Machine Learning Prediction
-  `voice_input`: id is 351764, Gender is Male, Age is 71, Driving_License is 1, Region_Code is 46, Previously_Insured is 1, Vehicle_Age is one to two years, Vehicle_Damage is No, Annual_Premium is 2630, Policy_Sales_Channel is 30, Vintage is 32
- `command`: Predict

Notes: If you want to implement data addition, the voice_input here must include 'Response' as the input data would be converted to the format compatible with the training set of machine learning.
