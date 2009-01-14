<cfcomponent extends="cfspec.lib.Matcher" output="false"><cfscript>

  function init(noCase) {
    var i = "";
    $noCase = len(noCase);
    if (arrayLen(arguments) < 2) throw("Application", "The Change matcher expected 1 argument, got #arrayLen(arguments)-1#.");
    $isMultiple = arrayLen(arguments) > 2;
    $changee = [];
    for (i = 2; i <= arrayLen(arguments); i++) {
      arrayAppend($changee, arguments[i]);
    }
    return this;
  }

  function isMatch(actual) {
    var eqMatcher = createObject("component", "cfspec.lib.matchers.Equal");
    var i = "";
    var before = [];
    for (i = 1; i <= arrayLen($changee); i++) {
      before[i] = $expectations.eval($changee[i]);
    }
    $expectations.eval(actual);
    for (i = 1; i <= arrayLen($changee); i++) {
      $before = before[i];
      $after = $expectations.eval($changee[i]);
      if (eqMatcher.init("", iif($noCase, de("NoCase"), de("")), $before).isMatch($after)) return false;
    }
    return true;
  }
  
  function getFailureMessage() {
    return "expected to change #prettyPrint($changee)#, got unchanged";
  }

  function getNegativeFailureMessage() {
    return "expected not to change #prettyPrint($changee)#, got changed";
  }

  function getDescription() {
    return "change #prettyPrint($changee)#";
  }

  function isChained() {
    return not ($negateExpectations or $isMultiple);
  }

  function by(delta) {
    var difference = getDifferenceAndScreenParams("", delta);
    if (difference != delta) $runner.fail("expected to change #prettyPrint($changee)# by #inspect(delta)#, got #inspect(difference)#");    
    return this;
  }

  function byAtLeast(delta) {
    var difference = getDifferenceAndScreenParams("AtLeast", delta);
    if (difference < delta) $runner.fail("expected to change #prettyPrint($changee)# by at least #inspect(delta)#, got #inspect(difference)#");    
    return this;
  }

  function byAtMost(delta) {
    var difference = getDifferenceAndScreenParams("AtMost", delta);
    if (difference > delta) $runner.fail("expected to change #prettyPrint($changee)# by at most #inspect(delta)#, got #inspect(difference)#");
    return this;
  }
  
  function from(before) {
    var eqMatcher = createObject("component", "cfspec.lib.matchers.Equal");
    var pass = eqMatcher.init("", iif($noCase, de("NoCase"), de("")), before).isMatch($before);
    if (!pass) $runner.fail("expected to change #prettyPrint($changee)# from #inspect(before)#, was #inspect($before)#");
    return this;
  }

  function to(after) {
    var eqMatcher = createObject("component", "cfspec.lib.matchers.Equal");
    var pass = eqMatcher.init("", iif($noCase, de("NoCase"), de("")), after).isMatch($after);
    if (!pass) $runner.fail("expected to change #prettyPrint($changee)# to #inspect(after)#, got #inspect($after)#");
    return this;
  }

  function getDifferenceAndScreenParams(relativity, delta) {
    if (not isNumeric(delta)) throw("Application", "The DELTA parameter to the Change().by#relativity#(delta) matcher must be a number.");
    if (not isNumeric($before)) throw("Application", "The BEFORE value of the Change().by#relativity#(delta) matcher must be a number.");
    if (not isNumeric($after)) throw("Application", "The AFTER value of the Change().by#relativity#(delta) matcher must be a number.");
    return $after - $before;
  }

  function prettyPrint(e) {
    var s = inspect(e[1]);
    var l = arrayLen(e);
    var i = "";
    for (i = 2; i < l; i++) {
      s = s & ", " & inspect(e[i]);
    }
    if (l > 1) {
      s = s & " and " & inspect(e[l]);
    }
    return s;
  }

</cfscript></cfcomponent>