Class ePy.Test Extends %Persistent
{

Property Name As %String;

Property TaxID As %String;

ClassMethod Run()
{
    Set p=..%New()
    Set p.Name="佐藤"
    Set p.TaxID="12345"
    Do p.Print()
}

Method Print() [ Language = python ]
{
    print ('\nName: ' + self.Name + ' TaxID: ' + self.TaxID)
}

Storage Default
{
<Data name="TestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>TaxID</Value>
</Value>
</Data>
<DataLocation>^ePy.TestD</DataLocation>
<DefaultData>TestDefaultData</DefaultData>
<IdLocation>^ePy.TestD</IdLocation>
<IndexLocation>^ePy.TestI</IndexLocation>
<StreamLocation>^ePy.TestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
