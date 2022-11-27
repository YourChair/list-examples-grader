rm -rf student-submission
git clone $1 student-submission
GRADE="0"

# check if ListExamples.java exists
cd student-submission
if [ -f ListExamples.java ]
then
    echo "ListExamples.java file found"
else
    echo "ListExamples.java file not found"
    echo "Grade is: "$GRADE
    exit 1
fi


CLASSPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
cd ..
cp -r lib student-submission/
cp TestListExamples.java student-submission/
cd student-submission
javac -cp $CLASSPATH *.java

# check that the compile went fine
if [ $? -eq 00 ]
then
    echo "Compilation succeeded"
else
    echo "Compilation failed"
    echo "Grade is: "$GRADE
    exit 1
fi

java -cp $CLASSPATH org.junit.runner.JUnitCore TestListExamples

if [ $? -eq 00 ]
then
    GRADE=2
    echo "Grade is: "$GRADE
else
    echo "Grade is: "$GRADE
fi