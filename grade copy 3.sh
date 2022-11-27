#CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
CPATH="\".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar\""

rm -rf student-submission

# make student submission directory (credit to lab group partner Jan Kwong who had this great idea of creating a student submission directory to work with)
mkdir student-submission
#step 1
git clone $1 student-submission

cp TestListExamples.java student-submission
cd student-submission

#step 2
# space before [[ ]] to avoid error
if [[ -f "ListExamples.java" ]]
    then 
        echo "File Found: +1 point"
    else
        echo "Wrong file submitted: Grade 0 (Submit right file or check file name)"
        exit 0
fi 

#step 3
#cp TestListExamples.java /student-submission

#step 4
#set +e
#javac -cp $CPATH *.java
javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java
#java -cp org.junit.runner.JUNITCORE TestListExamples

#$command 2 > file.txt

if [[ $? -eq 0 ]]
    then 
        echo "Compile Succesful: +1 point"
    else 
        echo "Compilation Failed: 1/5 Grade" 
        exit 0
fi 

#step 5
#credit to lab partner Jan Kwong who I borrowed the idea of using $CPATH to make sure we dont get the error of "error: package org.junit does not exist")
#java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > file2.txt
java -cp ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > file2.txt

if [[ $? -eq 0 ]]
    then
        cat file2.txt
        echo "Passed Tests: 5/5 A+ Grade :)"
        exit
    else 
        cat file2.txt
        echo "Tests have failed: 2/5 Grade"
        exit
fi