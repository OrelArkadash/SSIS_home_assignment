

  select OBJECT_NAME (object_id)   * from sys.columns

  select COUNT (*) from sys.columns
  where object_id = object_id ('Employees')


insert into [dbo].[countrows] 
select '[employees]' , (select COUNT (*) from [Employees]) ,
(select COUNT (*) from sys.columns
  where object_id = object_id ('[Employees]') )


declare @Tablename sysname = 'Employees'
declare @n varchar(max) = '' 

set @n = exec( ' select ''[' +  @Tablename + ']''  , (select count(*) from [' +  @Tablename + '] ) ,
(select COUNT (*) from sys.columns where object_id = object_id (''[' +  @Tablename + ']'' ))')

exec ( @n) 

,
--

declare @Tablename sysname = 'orders'
insert into [dbo].[countrows]
  exec( ' select ''[' +  @Tablename + ']''  , (select count(*) from [' +  @Tablename + '] ) ,
(select COUNT (*) from sys.columns where object_id = object_id (''[' +  @Tablename + ']'' ))')

select * from [dbo].[countrows]