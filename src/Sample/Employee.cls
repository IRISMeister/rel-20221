/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// This sample persistent class represents an employee.<br>
Class Sample.Employee Extends Person
{

/// The employee's job title.
Property Title As %String(MAXLEN = 50, POPSPEC = "Title()");

/// The employee's current salary.
Property Salary As %Integer(MAXVAL = 100000, MINVAL = 0);

/// A character stream containing notes about this employee.
Property Notes As %Stream.GlobalCharacter;

/// A picture of the employee
Property Picture As %Stream.GlobalBinary;

/// The company this employee works for.
Relationship Company As Company [ Cardinality = one, Inverse = Employees ];

/// Writes a .png file containing the picture, if any, of this employee
/// the purpose of this method is to prove that Picture really contains an image
Method WritePicture()
{
	if (..Picture="") {quit}
	set name=$TR(..Name,".") ; strip off trailing period
	set name=$TR(name,", ","__") ; replace commas and spaces
	set filename=name_".png"
	
	set file=##class(%Stream.FileBinary).%New()
	set file.Filename=filename
	do file.CopyFrom(..Picture)
	do file.%Save()
	write !, "Generated file: "_filename
}

Storage Default
{
<Data name="EmployeeDefaultData">
<Subscript>"Employee"</Subscript>
<Value name="1">
<Value>Title</Value>
</Value>
<Value name="2">
<Value>Salary</Value>
</Value>
<Value name="3">
<Value>Notes</Value>
</Value>
<Value name="4">
<Value>Picture</Value>
</Value>
<Value name="5">
<Value>Company</Value>
</Value>
</Data>
<DefaultData>EmployeeDefaultData</DefaultData>
<ExtentSize>100</ExtentSize>
<Property name="%%CLASSNAME">
<AverageFieldSize>19</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Age">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1.5873%</Selectivity>
</Property>
<Property name="Company">
<AverageFieldSize>3.55</AverageFieldSize>
<Selectivity>5.0000%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>4.02</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="FavoriteColors">
<AverageFieldSize>9.45</AverageFieldSize>
<OutlierSelectivity>.29:</OutlierSelectivity>
<Selectivity>1.9189%</Selectivity>
</Property>
<Property name="Home">
<AverageFieldSize>37.97,City:9.16,State:4,Street:18.37,Zip:4.44</AverageFieldSize>
<Selectivity>1.0000%,City:3.8462%,State:2.2222%,Street:1.0000%,Zip:1.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>18.33</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Notes">
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Office">
<AverageFieldSize>38.06,City:9.12,State:4,Street:18.61,Zip:4.33</AverageFieldSize>
<Selectivity>1.0000%,City:3.8462%,State:2.3810%,Street:1.0000%,Zip:1.0101%</Selectivity>
</Property>
<Property name="Picture">
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SSN">
<AverageFieldSize>13</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Salary">
<AverageFieldSize>4.34</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Spouse">
<AverageFieldSize>3.89</AverageFieldSize>
<Selectivity>1.4706%</Selectivity>
</Property>
<Property name="Title">
<AverageFieldSize>22.19</AverageFieldSize>
<Selectivity>1.4085%</Selectivity>
</Property>
<SQLMap name="$Employee">
<BlockCount>-4</BlockCount>
</SQLMap>
<Type>%Storage.Persistent</Type>
}

}
