require 'pycall/import'
require 'base64'
require 'tempfile'

include PyCall::Import

PyCall.sys.path.append('./lib/python')

class PklParserJob
  include Sidekiq::Job

  sidekiq_options retry: 5, queue: :default

  def perform(*args)
    begin
      PyCall.init

      Rails.logger.debug("Performing ExampleJob with arguments: #{args.inspect}")
      Rails.logger.debug("::: Start calling")
      test_import = PyCall.import_module('test_import')
      test_import.main()
      result = test_import.open_file(90, 10)
  
      Rails.logger.debug("::: Start read_file")
      read_file = PyCall.import_module('read_file')
      read_file.main()
      # result = read_file.open_file(90, 10)
      Rails.logger.debug(result)
      Rails.logger.debug("::: Finish Job")
      # return result
    rescue PyCall::PyError => e
      Rails.logger.error("An error occurred in the Python script: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("An unexpected error occurred: #{e.message}")
    end
  end
end
