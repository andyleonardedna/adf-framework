Use dbadffw
go

print 'fw schema'
If Not Exists(Select s.[name]
              From [sys].[schemas] s
			  Where s.[name] = N'fw')
 begin
  print ' - creating fw schema'
  declare @fwSql nvarchar(100) = N'Create Schema fw;'
  exec(@fwSql);
  print ' - fw schema created'
 end
Else
 begin
  print ' - fw schema already exists.'
 end
 print ''

print 'fw.application table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'fw'
			    And t.[name] = N'application')
 begin
  print ' - creating fw.application table'
  
  Create Table fw.application
  (
   applicationId int identity(1,1) Not NULL
    Constraint PK_fw_application
	 Primary Key
  ,applicationName nvarchar(255) Not NULL
    Constraint UQ_fw_applicationName 
	 Unique
  ,applicationDescription nvarchar(2000) NULL
  )

  print ' - fw.application table created'
 end
Else
 begin
  print ' - fw.application table already exists.'
 end
 print ''


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
  ,pipelineName nvarchar(255) Not NULL
  ,pipelineDescription nvarchar(2000) NULL
  )

  print ' - fw.pipeline table created'
 end
Else
 begin
  print ' - fw.pipeline table already exists.'
 end
 print ''
 
print 'fw.applicationpipeline table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'fw'
			    And t.[name] = N'applicationpipeline')
 begin
  print ' - creating fw.applicationpipeline table'
  
  Create Table fw.applicationpipeline
  (
   applicationpipelineId int identity(1,1) Not NULL
    Constraint PK_fw_applicationpipeline
	 Primary Key
  ,applicationId int Not NULL
    Constraint FK_fw_applicationpipeline_application
	 Foreign Key 
	  References fw.[application](applicationId)
  ,pipelineId int NULL
    Constraint FK_fw_applicationpipeline_pipeline
	 Foreign Key 
	  References fw.pipeline(pipelineId)
  ,executionOrder int Not NULL
    Constraint DF_fw_applicationpipeline_executionOrder
	 Default(10)
  )

  print ' - fw.applicationpipeline table created'
 end
Else
 begin
  print ' - fw.applicationpipeline table already exists.'
 end
 print ''

