<cfimport taglib="/cfspec" prefix="">

<describe hint="Equal">

  <describe hint="Numeric">

    <before>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Numeric", "", 5))>
    </before>

    <it should="match when actual == expected">
      <cfset $matcher.isMatch(5).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset $matcher.isMatch(6).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
  	  <cfset $matcher.isMatch(6)>
      <cfset $matcher.getFailureMessage().shouldEqual("expected 5, got 6")>
    </it>

    <it should="provide a useful negative failure message">
  	  <cfset $matcher.isMatch(5)>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal 5, got 5")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal 5")>
    </it>

  </describe>

  <describe hint="Date">

    <before>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Date", "", createDate(2001, 9, 11)))>
    </before>

    <it should="match when actual == expected">
      <cfset $matcher.isMatch(createDate(2001, 9, 11)).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset $matcher.isMatch(createDate(2001, 9, 12)).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
  	  <cfset $matcher.isMatch(createDate(2001, 9, 12))>
      <cfset $matcher.getFailureMessage().shouldEqual("expected 2001-09-11 12:00 AM, got 2001-09-12 12:00 AM")>
    </it>

    <it should="provide a useful negative failure message">
  	  <cfset $matcher.isMatch(createDate(2001, 9, 11))>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal 2001-09-11 12:00 AM, got 2001-09-11 12:00 AM")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal 2001-09-11 12:00 AM")>
    </it>

  </describe>

  <describe hint="Boolean">

    <before>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Boolean", "", true))>
    </before>

    <it should="match when actual == expected">
      <cfset $matcher.isMatch(true).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset $matcher.isMatch(false).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
  	  <cfset $matcher.isMatch(false)>
      <cfset $matcher.getFailureMessage().shouldEqual("expected true, got false")>
    </it>

    <it should="provide a useful negative failure message">
  	  <cfset $matcher.isMatch(true)>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal true, got true")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal true")>
    </it>

  </describe>

  <describe hint="String">

    <before>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("String", "", "Who is John Galt?"))>
    </before>

    <it should="match when actual == expected">
      <cfset $matcher.isMatch("Who is John Galt?").shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset $matcher.isMatch("WHO IS JOHN GALT?").shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
  	  <cfset $matcher.isMatch("WHO IS JOHN GALT?")>
      <cfset $matcher.getFailureMessage().shouldEqual("expected 'Who is John Galt?', got 'WHO IS JOHN GALT?'")>
    </it>

    <it should="provide a useful negative failure message">
  	  <cfset $matcher.isMatch("Who is John Galt?")>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal 'Who is John Galt?', got 'Who is John Galt?'")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal 'Who is John Galt?'")>
    </it>

  </describe>

  <describe hint="Object">

    <before>
      <cfset obj = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Doe")>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Object", "", obj))>
    </before>

    <it should="match when actual == expected">
      <cfset target = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Doe")>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset target = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Hancock")>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
      <cfset target = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Hancock")>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getFailureMessage().shouldEqual("expected &lt;SupportsEquals:4C2A904BAFBA06591225113AD17B5CEC&gt;, got &lt;SupportsEquals:D046FCFE9A473C5BE23EE78F9629B0A6&gt;")>
    </it>

    <it should="provide a useful negative failure message">
      <cfset target = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Doe")>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal &lt;SupportsEquals:4C2A904BAFBA06591225113AD17B5CEC&gt;, got &lt;SupportsEquals:4C2A904BAFBA06591225113AD17B5CEC&gt;")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal &lt;SupportsEquals:4C2A904BAFBA06591225113AD17B5CEC&gt;")>
    </it>

  </describe>

  <describe hint="Struct">

    <before>
      <cfset struct = {a="foo",b="bar",c="baz"}>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Struct", "", struct))>
    </before>

    <it should="match when actual == expected">
      <cfset target = {a="foo",b="bar",c="baz"}>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset target = {a="foo",b="Bar",c="baz"}>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
      <cfset target = {a="foo",b="Bar",c="baz"}>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getFailureMessage().shouldEqual("expected {A='foo',B='bar',C='baz'}, got {A='foo',B='Bar',C='baz'}")>
    </it>

    <it should="provide a useful negative failure message">
      <cfset target = {a="foo",b="bar",c="baz"}>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal {A='foo',B='bar',C='baz'}, got {A='foo',B='bar',C='baz'}")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal {A='foo',B='bar',C='baz'}")>
    </it>

  </describe>

  <describe hint="Array">

    <before>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Array", "", listToArray("a,b,c")))>
    </before>

    <it should="match when actual == expected">
      <cfset target = listToArray("a,b,c")>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset target = listToArray("a,B,c")>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
      <cfset target = listToArray("a,B,c")>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getFailureMessage().shouldEqual("expected ['a','b','c'], got ['a','B','c']")>
    </it>

    <it should="provide a useful negative failure message">
      <cfset target = listToArray("a,b,c")>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal ['a','b','c'], got ['a','b','c']")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal ['a','b','c']")>
    </it>

  </describe>

  <describe hint="Query">

    <before>
      <cfset query = queryNew("")>
      <cfset queryAddColumn(query, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(query, "bar", listToArray("b,e,h"))>
      <cfset queryAddColumn(query, "baz", listToArray("c,f,i"))>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Query", "", query))>
    </before>

    <it should="match when actual == expected">
      <cfset target = queryNew("")>
      <cfset queryAddColumn(target, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(target, "bar", listToArray("b,e,h"))>
      <cfset queryAddColumn(target, "baz", listToArray("c,f,i"))>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != expected">
      <cfset target = queryNew("")>
      <cfset queryAddColumn(target, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(target, "bar", listToArray("b,E,h"))>
      <cfset queryAddColumn(target, "baz", listToArray("c,f,i"))>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="provide a useful failure message">
      <cfset target = queryNew("")>
      <cfset queryAddColumn(target, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(target, "bar", listToArray("b,E,h"))>
      <cfset queryAddColumn(target, "baz", listToArray("c,f,i"))>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getFailureMessage().shouldEqual("expected {COLUMNS=['BAR','BAZ','FOO'],DATA=[['b','c','a'],['e','f','d'],['h','i','g']]}, got {COLUMNS=['BAR','BAZ','FOO'],DATA=[['b','c','a'],['E','f','d'],['h','i','g']]}")>
    </it>

    <it should="provide a useful negative failure message">
      <cfset target = queryNew("")>
      <cfset queryAddColumn(target, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(target, "bar", listToArray("b,e,h"))>
      <cfset queryAddColumn(target, "baz", listToArray("c,f,i"))>
      <cfset $matcher.isMatch(target)>
      <cfset $matcher.getNegativeFailureMessage().shouldEqual("expected not to equal {COLUMNS=['BAR','BAZ','FOO'],DATA=[['b','c','a'],['e','f','d'],['h','i','g']]}, got {COLUMNS=['BAR','BAZ','FOO'],DATA=[['b','c','a'],['e','f','d'],['h','i','g']]}")>
    </it>

    <it should="describe itself">
    	<cfset $matcher.getDescription().shouldEqual("equal {COLUMNS=['BAR','BAZ','FOO'],DATA=[['b','c','a'],['e','f','d'],['h','i','g']]}")>
    </it>

  </describe>

  <describe hint="Mixed Simple Types">

    <it should="convert arguments to numbers when Numeric is specified">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Numeric", "", "123abc"))>
      <cfset $matcher.isMatch("123xyz").shouldBeTrue()>
    </it>

    <it should="convert arguments to dates when Date is specified">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Date", "", "1/1/01"))>
      <cfset $matcher.isMatch("January 1, 2001").shouldBeTrue()>
    </it>

    <it should="convert arguments to booleans when Boolean is specified">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Boolean", "", "123"))>
      <cfset $matcher.isMatch(42).shouldBeTrue()>
    </it>

    <it should="convert arguments to strings when String is specified">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Boolean", "", 42))>
      <cfset $matcher.isMatch("42").shouldBeTrue()>
    </it>

  </describe>

  <describe hint="Unspecified Type">

    <it should="match when actual == target (auto-sense numeric)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", 12))>
      <cfset $matcher.isMatch("12.0").shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense numeric)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", 12))>
      <cfset $matcher.isMatch("12.1").shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense date)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", createDate(2001, 9, 11)))>
      <cfset $matcher.isMatch("9/11/01").shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense date)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", createDate(2001, 9, 11)))>
      <cfset $matcher.isMatch("9/11/02").shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense boolean)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", true))>
      <cfset $matcher.isMatch("Yes").shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense boolean)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", true))>
      <cfset $matcher.isMatch("No").shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense string)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", "123abc"))>
      <cfset $matcher.isMatch("123abc").shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense string)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", "123abc"))>
      <cfset $matcher.isMatch("123xyz").shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense object)">
      <cfset obj = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Doe")>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", obj))>
      <cfset target = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Doe")>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense object)">
      <cfset obj = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Doe")>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", obj))>
      <cfset target = createObject("component", "cfspec.spec.assets.SupportsEquals").init("John Hancock")>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense struct)">
      <cfset struct = {a="foo",b="bar",c="baz"}>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", struct))>
      <cfset target = {a="foo",b="bar",c="baz"}>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense struct)">
      <cfset struct = {a="foo",b="bar",c="baz"}>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", struct))>
      <cfset target = {a="foo",b="Bar",c="baz"}>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense array)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Array", "", listToArray("a,b,c")))>
      <cfset target = listToArray("a,b,c")>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense array)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Array", "", listToArray("a,b,c")))>
      <cfset target = listToArray("a,B,c")>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

    <it should="match when actual == target (auto-sense query)">
      <cfset query = queryNew("")>
      <cfset queryAddColumn(query, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(query, "bar", listToArray("b,e,h"))>
      <cfset queryAddColumn(query, "baz", listToArray("c,f,i"))>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Query", "", query))>
      <cfset target = queryNew("")>
      <cfset queryAddColumn(target, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(target, "bar", listToArray("b,e,h"))>
      <cfset queryAddColumn(target, "baz", listToArray("c,f,i"))>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>

    <it should="not match when actual != target (auto-sense query)">
      <cfset query = queryNew("")>
      <cfset queryAddColumn(query, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(query, "bar", listToArray("b,e,h"))>
      <cfset queryAddColumn(query, "baz", listToArray("c,f,i"))>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("Query", "", query))>
      <cfset target = queryNew("")>
      <cfset queryAddColumn(target, "foo", listToArray("a,d,g"))>
      <cfset queryAddColumn(target, "bar", listToArray("b,E,h"))>
      <cfset queryAddColumn(target, "baz", listToArray("c,f,i"))>
      <cfset $matcher.isMatch(target).shouldBeFalse()>
    </it>

  </describe>

  <describe hint="Mismatched Types">
    
    <it should="not match when actual is simple and target is complex">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", "[1,2,3]"))>
      <cfset $matcher.isMatch(listToArray("1,2,3")).shouldBeFalse()>
    </it>

    <it should="not match when actual is complex and target is simple">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", "[1,2,3]"))>
      <cfset $matcher.isMatch(listToArray("1,2,3")).shouldBeFalse()>
    </it>
    
    <it should="not match when actual and target are different complex types">
      <cfset struct = {a=1,b=2,c=3}>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "", struct))>
      <cfset $matcher.isMatch(listToArray("1,2,3")).shouldBeFalse()>
    </it>

  </describe>

  <describe hint="NoCase">

    <it should="match when actual == target (strings of different case)">
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "NoCase", "foo"))>
      <cfset $matcher.isMatch("FOO").shouldBeTrue()>
    </it>

    <it should="match when actual == target (arrays with elements that differ by case)">
      <cfset array = ["a", "b", "c"]>
      <cfset $matcher = $(createObject("component", "cfspec.lib.matchers.Equal").init("", "NoCase", array))>
      <cfset target = ["A", "B", "C"]>
      <cfset $matcher.isMatch(target).shouldBeTrue()>
    </it>
  
  </describe>

</describe>