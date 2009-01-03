<cfcomponent extends="cfspec.lib.Matcher" output="false"><cfscript>

	function init(predicate) {
		var i = "";
		$predicate = predicate;
		$args = [];
		$flatArgs = "";
		for (i = 2; i <= arrayLen(arguments); i++) {
		  arrayAppend($args, arguments[i]);
		  $flatArgs = listAppend($flatArgs, "$args[#i-1#]");
		}
		return this;
	}

	function isMatch(actual) {
		$actual = actual;
		switch ($predicate) {

		case "True":
			return $actual eq true;

		case "False":
			return $actual eq false;

		default:
  		$actual = evaluate("$actual.is#$predicate#(#$flatArgs#)");
  		return $actual;
		}
	}

	function getFailureMessage() {
    return "expected #predicateExpectation(false)#, got #inspect($actual)#";			
	}

	function getNegativeFailureMessage() {
    return "expected #predicateExpectation(true)#, got #inspect($actual)#";			
	}

	function getDescription() {
		return reReplace(predicateExpectation(false), "^to\s+", "");
	}

  function predicateExpectation(negative) {
		switch ($predicate) {
  		case "True":  return iif(negative, de('not '), de('')) & "to be true";
  		case "False": return iif(negative, de('not '), de('')) & "to be false";
  		default:      return "is#$predicate#(#reReplace(inspect($args), '^\[(.*)\]$', '\1')#) to be " & iif(negative, de('false'), de('true'));
		}
  }

</cfscript></cfcomponent>