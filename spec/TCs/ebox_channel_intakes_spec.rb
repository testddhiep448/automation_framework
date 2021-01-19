require_relative '../../spec/spec_helper'

describe 'eBox channel intakes', :ebox do

###################################################################################################
  let(:test_data) { EnvironmentConfig.instance.data }
  let(:support_email) { test_data[:existing_users][:support_app_user][:email] }
  let(:support_password) { test_data[:existing_users][:support_app_user][:password] }
  let(:intake_email) { test_data[:existing_users][:qa_generic_intake_user][:email] }
  let(:intake_password) { test_data[:existing_users][:qa_generic_intake_user][:password] }
  let(:customer_name) { test_data[:customers][:name] }
  let(:sender_id) { test_data[:customers][:sender_id] }
  # specification for ebox
  let(:ebox_user) { 'bosaeboxtest13' }
  let(:ebox_password) { 'bosaeboxtest13' }
  let(:token_array) { %w[ NOYULE RARUZO RUGOBI MIDONA VUSEPE MIKALE JOHANE BUBACU HUFEBU ZOVUMA FUJIDI JUHECO
                          WUZUBE POZOJI HAHUBI ZENOYE MISASU ZICIJO DINIBE CELEHO FEVAQE FAFIFI MEQECE POKARE ] }
###################################################################################################
  it '[C162417] Intake with 2 attachments to eBox Citizen [FR]' do
  
  end
end
