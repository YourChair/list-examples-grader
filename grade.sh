# Create your grading script here

#set -e

grade="Grade: 0/6 (file not found)"

rm -rf student-submission
git clone $1 student-submission


cd student-submission/


if [[ -f $"ListExamples.java" ]]
    then
    grade="Grade: 1/6 (file exists, but tests do not compile)"

    

    #run tests
    cd ..
    cp -r lib student-submission/
    cp TestListExamples.java student-submission/
    cd student-submission
    javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java


    if [[ $? -ne 0 ]] # if the exit code is not 0 for the tests
        then
        echo $grade
        exit 2
    
    else
        grade="Grade: 2/6 (tests compile but don't pass)"
        
    fi

    rm -rf file2.txt
    java -cp ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > file2.txt

    if [[ $? -ne 0 ]] # if the exit code is not 0 for the tests
        then

        echo $grade
        echo `cat file2.txt | grep "There w"`
        echo `cat file2.txt | grep "1)"`
        echo `cat file2.txt | grep "2)"`
        echo `cat file2.txt | grep "Tests run:"`
        exit 3
    
    else
        
        #RESULT=cat file2.txt
        echo "Grade: 6/6 (all tests pass). Output: "
        echo `cat file2.txt | grep "OK"`
        exit 0
        
        
    fi
    
else
    echo $grade
    exit 1
fi

echo $grade
