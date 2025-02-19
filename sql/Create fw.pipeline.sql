Use dbadffw;
go

print 'fw schema'
If Not Exists(Select s.[name]
              From [sys].[schemas] s
			  Where s.[name] = N'fw')
 begin
  print ' - creating fw schema'
  declare @fwSchemaSql varchar(100) = 'Create schema fw;';
  exec(@fwSchemaSql);
  print ' - fw schema created'
 end
Else
 begin
  print ' - fw schema already exists.'
 end
print '';

print 'fw.pipeline table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'fw'
			    And t.[name] = N'pipeline')
 begin
  print ' - creating fw.pipeline table'
  Create Table fw.pipeline
  (
   pipelineId int identity(1,1) Not NULL
    Constraint PK_fw_pipeline
	 Primary Key
	  Clustered
  ,pipelineName nvarchar(255) Not NULL
  )
  print ' - fw.pipeline table created'
 end
Else
 begin
  print ' - fw.pipeline table already exists.'
 end
print ''

