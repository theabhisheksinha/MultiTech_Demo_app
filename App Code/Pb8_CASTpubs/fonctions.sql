create function Fct_Return_Scalar() returns int as 
begin
	return suser_sid()
end
go
create table GenericTable (col int, col2 int,col3 int)
go
create function Fct_Return_InLine_Table(@Param int) returns table as
return 
select * from GenericTable where col = @Param
go
create function Fct_Return_Table(@Param int) returns @RetTable table (col int, col2 int) as
begin
	declare @Toto table (A int, B int)
	insert into @Toto select col,col2 from GenericTable where col2 < col3
	insert into @Toto select col,col3 from GenericTable where col2 > col3
	return
end
go