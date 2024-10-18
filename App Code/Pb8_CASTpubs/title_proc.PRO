use CASTpubs
go

If Exists(Select name
           From sysobjects
           Where name='title_proc'
           And type='P'
           And uid = User_id('dbo'))
  Drop Procedure dbo.title_proc
go

Create Proc dbo.title_proc ( 
     @title varchar(80) 
                   ) 
As
  Begin
/**********************************************************
*Procedure  Name: title_proc
*Database: CASTpubs
*Server: CWQUALIF2
*CAST SQL-Builder  R3.7
*File Path:
* D:\ABD\Tests\MS_SYB\Pb_sql\Pb_CPubs\title_proc.PRO
*********************************************************/

select @title = lower( @title ) + '%'
select  title, title_id, price
from    titles
where   lower(title) like @title
return @@rowcount


End

go

/*-----------------------------------------------------------
 CW permissions part in file
-----------------------------------------------------------*/
grant Execute on dbo.title_proc to public

go
