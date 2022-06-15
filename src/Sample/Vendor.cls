/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// The Vendor class is a persistent class 
/// containing vendor information.<br>
/// This class demonstrates how to use the %CacheSQLStorage storage 
/// class to provide custom storage for a persistent class. Typically the 
/// %CacheSQLStorage storage class is used to provide object access 
/// to previously existing storage structures.
Class Sample.Vendor Extends (%Persistent, %Populate, %XML.Adaptor) [ SqlRowIdName = Vendor, StorageStrategy = SQLStorage ]
{

/// Name Index
Index IndexNName On Name;

/// Vendor name.
Property Name As %String(POPSPEC = "Company()");

/// Vendor address.
Property Address As Address(POPSPEC = "##class(Address).PopulateSerial()");

/// Name of primary vendor contact.
Property Contact As %String(POPSPEC = "Name()");

/// Discount rate.
Property DiscRate As %Float(MAXVAL = 100, MINVAL = 0);

/// Discount days.
Property DiscDays As %Integer(MAXVAL = 999, MINVAL = 0);

/// Net days.
Property NetDays As %Integer(MAXVAL = 999, MINVAL = 0);

/// Days clear.
Property DaysClear As %Integer(MAXVAL = 999, MINVAL = 0);

/// Payment Flag
Property PayFlag As %String(DISPLAYLIST = ",Never,Minimum", VALUELIST = ",N,M");

/// Minimum Payment.
Property MinPayment As %Float(MAXVAL = 999999, MINVAL = 0);

/// Last Invoice Date.
Property LastInvDate As %Date(MAXVAL = "", MINVAL = "");

/// Last Payment Date.
Property LastPayDate As %Date(MAXVAL = "", MINVAL = "");

/// Balance.
Property Balance As %Float(MAXVAL = 999999999, MINVAL = -999999999);

/// Vendor tax reporting status.
Property TaxReporting As %String(DISPLAYLIST = ",Exempt,Required", VALUELIST = ",E,");

Storage SQLStorage
{
<ExtentSize>100</ExtentSize>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Address">
<AverageFieldSize>37.85,City:8.94,State:4,Street:18.51,Zip:4.4</AverageFieldSize>
<Selectivity>1.0000%,City:4.1667%,State:2.2727%,Street:1.0000%,Zip:1.0000%</Selectivity>
</Property>
<Property name="Balance">
<AverageFieldSize>5.99</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Contact">
<AverageFieldSize>17.76</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="DaysClear">
<AverageFieldSize>3.8</AverageFieldSize>
<Selectivity>1.0417%</Selectivity>
</Property>
<Property name="DiscDays">
<AverageFieldSize>3.67</AverageFieldSize>
<Selectivity>1.0526%</Selectivity>
</Property>
<Property name="DiscRate">
<AverageFieldSize>2.99</AverageFieldSize>
<Selectivity>1.4493%</Selectivity>
</Property>
<Property name="LastInvDate">
<AverageFieldSize>4.01</AverageFieldSize>
<Selectivity>1.0101%</Selectivity>
</Property>
<Property name="LastPayDate">
<AverageFieldSize>4.03</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="MinPayment">
<AverageFieldSize>4.96</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>18.97</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="NetDays">
<AverageFieldSize>3.65</AverageFieldSize>
<Selectivity>1.0309%</Selectivity>
</Property>
<Property name="PayFlag">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="TaxReporting">
<AverageFieldSize>2.45</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<SqlIdExpression>$i(^Sample.VendorD)</SqlIdExpression>
<SQLMap name="DataMasterMap">
<BlockCount>-8</BlockCount>
<Data name="Address">
<Piece>2</Piece>
</Data>
<Data name="Balance">
<Node>1</Node>
<Piece>3</Piece>
</Data>
<Data name="Contact">
<Piece>3</Piece>
</Data>
<Data name="DaysClear">
<Piece>7</Piece>
</Data>
<Data name="DiscDays">
<Piece>5</Piece>
</Data>
<Data name="DiscRate">
<Piece>4</Piece>
</Data>
<Data name="LastInvDate">
<Node>1</Node>
<Piece>1</Piece>
</Data>
<Data name="LastPayDate">
<Node>1</Node>
<Piece>2</Piece>
</Data>
<Data name="MinPayment">
<Piece>9</Piece>
</Data>
<Data name="Name">
<Piece>1</Piece>
</Data>
<Data name="NetDays">
<Piece>6</Piece>
</Data>
<Data name="PayFlag">
<Piece>8</Piece>
</Data>
<Data name="TaxReporting">
<Piece>10</Piece>
</Data>
<Global>^Sample.DataD</Global>
<Structure>list</Structure>
<Subscript name="1">
<Expression>{Vendor}</Expression>
</Subscript>
<Type>data</Type>
</SQLMap>
<SQLMap name="IndexNName">
<BlockCount>-4</BlockCount>
<Global>^Sample.VendorI</Global>
<Structure>list</Structure>
<Subscript name="1">
<Expression>"N"</Expression>
</Subscript>
<Subscript name="2">
<Expression>$$SQLUPPER({Name})</Expression>
</Subscript>
<Subscript name="3">
<Expression>{Vendor}</Expression>
</Subscript>
<Type>index</Type>
</SQLMap>
<StreamLocation>^Sample.VendorS</StreamLocation>
<Type>%Storage.SQL</Type>
}

}
