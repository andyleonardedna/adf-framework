--select pipelineName
--From fw.pipeline
--Order By pipelineId;

select *
From fw.[application]

select *
From fw.pipeline

select *
From fw.applicationpipeline

Select p.pipelineName
, ap.ExecutionOrder
From fw.applicationpipeline ap
Join fw.[application] a
  On a.applicationId = ap.applicationId
Join fw.pipeline p
  On p.pipelineId = ap.pipelineId
Where a.applicationName = N'App One'--@applicationName
Order By ap.ExecutionOrder
