# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission



if (-f "ListExamples.java")
    then
    echo "File exists"
    mkdir gradingDir
    cp student-submission gradingDir
    cp TestListExamples.java gradingDir
    cd gradingDir
    unset -e
    javac ".\*.java"
    java ListExamples
    stderr abc

    #run tests
    if ($? != 0)
        then
        echo "tests do not pass"
    
    else
        echo "the tests pass"
    fi
else
    echo "File not found"
    exit
fi

