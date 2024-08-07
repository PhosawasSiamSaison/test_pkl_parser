require 'pycall/import'

include PyCall::Import

# ENV['PYTHONPATH'] = "#{Rails.root}/lib/python"
PyCall.sys.path.append('./lib/python')

class PklJob < ApplicationJob
  queue_as :default

  def perform(*args)
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
  end
end
