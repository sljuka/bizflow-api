process = @result[:data].process.reload
json.message @result[:message]
json.data do
  json.process do
    json.partial! 'api/v1/processes/process', process: process
  end
end