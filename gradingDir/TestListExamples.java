import static org.junit.Assert.*;
import org.junit.*;
import java.util.*;

class aChecker implements StringChecker {
  public boolean checkString(String s) {
      return s.contains("a");
  }
}

public class TestListExamples {
  // Write your grading tests here!

  int passCount = 0;
  @Test
  public void TestFilter() {
    StringChecker checkerA = new aChecker();
    List<String> expected = new ArrayList<>();
    expected.add("a");
    expected.add("ab");
    expected.add("ba");
    expected.add("abc");
    expected.add("cab");
    expected.add("aaaaaaaaaaaa");
    List<String> toFilter = new ArrayList<>(expected);
    toFilter.add("b");
    toFilter.add("bc");
    toFilter.add("cb");

    assertEquals(expected, ListExamples.filter(toFilter, checkerA));
    
  }

  public void TestMerge() {
    StringChecker checkerA = new aChecker();
    List<String> input1 = new ArrayList<>();
    List<String> input2 = new ArrayList<>();
    List<String> expected = new ArrayList<>();
    input1.add("a");
    input1.add("b");
    input1.add("d");
    input1.add("g");
    input1.add("i");
    input1.add("k");

    input2.add("c");
    input2.add("e");
    input2.add("f");
    input2.add("h");
    input2.add("j");
    input2.add("l");

    expected.add("a");
    expected.add("b");
    expected.add("c");
    expected.add("d");
    expected.add("e");
    expected.add("f");
    expected.add("g");
    expected.add("h");
    expected.add("i");
    expected.add("j");
    expected.add("k");
    expected.add("l");
    

    assertEquals(expected, ListExamples.merge(input1, input2));
    
  }

  
  
}