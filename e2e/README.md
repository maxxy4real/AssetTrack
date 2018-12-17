*** Getting Started ***
To get right up and started, you can download the project (zip) or you can clone the project from the repo.

Prerequisites
Maven
jUnit 4
Java
WebDriver (Chrome, Firefox, IE, etc)
Selenium
Cucumber JVM

*** Set Up ***
You need to have the below Installed and configured.
 - Chromedriver
 - Java
 - Maven

To add Chromedriver on Windows:

Download the latest chrome driver from http://chromedriver.chromium.org/downloads
1. Put the chromedriver executable on your c drive
2. Add path address to the systen PATH variable
3. open up a terminal and you should be able to see chromedriver -v

To get right up and started, you can download the project (zip) or you can clone the project from the repo.

 To install Apache Maven on Windows, you just need to download the Maven’s zip file, and
 Unzip it to the directory you wish to install, and configure the Windows environment variables.

 1. JDK and JAVA_HOME
 Make sure JDK is installed, and “JAVA_HOME” variable is added as Windows environment variable.

 2. Download Apache Maven
 Visit Maven official website, download the Maven zip file, for example : apache-maven-3.3.3-bin.zip.
 Unzip it to the folder you want to install Maven.
 Assume you unzip to this folder – C:\Program Files\Apache\maven

 3. Add M2_HOME and MAVEN_HOME
 Add both M2_HOME and MAVEN_HOME variables in the Windows environment, and point it to your Maven folder.
 M2_HOME or MAVEN_HOME
 Maven document said add M2_HOME only, but some programs still reference Maven folder with MAVEN_HOME, so, it’s safer to add both.

 4. Add To PATH
 Update PATH variable, append Maven bin folder – %M2_HOME%\bin, so that you can run the Maven’s command everywhere.

 5. Verification
 Done, to verify it, run mvn –version in the command prompt.

 C:\Users\maxwell>mvn -version
 Apache Maven 3.2.2 (45f7c06d68e745d05611f7fd14efb6594181933e; 2014-06-17T21:51:42+08:00)
 Maven home: C:\Program Files\Apache\maven
 Java version: 1.7.0_65, vendor: Oracle Corporation
 Java home: C:\Program Files\Java\jdk1.7.0_65\jre
 Default locale: en_US, platform encoding: Cp1252
 OS name: "windows 8.1", version: "6.3", arch: "amd64", family: "windows"

 If you see a similar message, means the Apache Maven is installed successfully on Window


*** To Execute Test ***
1. To Run the entire test - Go to the Path of the folder and type:

   mvn clean test

2 To run a particular scenario, e.g GasSafety - Go to the Path of the folder and type:

   mvn clean test -Dcucumber.options="--tags @chargeFixesProductionIncidents"





