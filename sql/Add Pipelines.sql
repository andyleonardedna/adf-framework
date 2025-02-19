Use dbadffw;
go

print 'child3 pipeline'
If Not Exists(Select p.pipelineName
              From fw.pipeline p
              Where p.pipelineName = N'child3')
 begin
  print ' - adding child3 pipeline'
  insert Into fw.pipeline
   (pipelineName)
  values
   ('child3')
  print ' - child3 pipeline added'
 end
Else
 begin
  print ' - child3 pipeline already exists in the fw.pipeline table.'
 end
print ''

print 'child1 pipeline'
If Not Exists(Select p.pipelineName
              From fw.pipeline p
              Where p.pipelineName = N'child1')
 begin
  print ' - adding child1 pipeline'
  insert Into fw.pipeline
   (pipelineName)
  values
   ('child1')
  print ' - child1 pipeline added'
 end
Else
 begin
  print ' - child1 pipeline already exists in the fw.pipeline table.'
 end
print ''

print 'child2 pipeline'
If Not Exists(Select p.pipelineName
              From fw.pipeline p
              Where p.pipelineName = N'child2')
 begin
  print ' - adding child2 pipeline'
  insert Into fw.pipeline
   (pipelineName)
  values
   ('child2')
  print ' - child2 pipeline added'
 end
Else
 begin
  print ' - child2 pipeline already exists in the fw.pipeline table.'
 end
print ''

