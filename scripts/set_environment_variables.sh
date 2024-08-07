#!/bin/bash
function set_parameter {
  SSM_PARAM_NAME=$1
  SSM_VALUE=`aws ssm get-parameters --name "${SSM_PARAM_NAME}" --query 'Parameters[*].Value' --output text`
  [ "$(eval echo "$"$1)" == "" ] && echo "export ${SSM_PARAM_NAME}=${SSM_VALUE}" >> ~/.bashrc
}
echo "export RAILS_ENV=production" >> ~/.bashrc
set_parameter "SECRET_KEY_BASE"
