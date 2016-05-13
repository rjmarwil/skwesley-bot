#!/usr/bin/ruby
require 'sinatra'
require 'httparty'
require 'json'

post '/gateway' do
  message = params[:text].gsub(params[:trigger_word], '').strip

  #Cases to deal with various inputs
  #Put any new code here
  case message
    when 'help', ''
      respond_message "skwesley blink <env> - Show console link to environment\n
                        skwesley blink-uaa <env> - Show UAA console link to environment\n
                        skwesley ibmadmin <env> - Grab ibmadmin password from Doctor\n
                        skwesley ibmuser <env> - Grab ibmuser password from Doctor\n
                        skwesley vcap <env> - Grab vcap password from Doctor\n
                        skwesley vcap - Show important vcap commands\n
                        skwesley envs - List all environments"
    when 'envs'
      environments = envs
      respond_message "#{environments}"
    else
      respond_message ""
  end
end

#Convert output to json that Slack recognizes
def respond_message message
  content_type :json
  {:text => message}.to_json
end

#Show console link to environment
def blink environment

end

#Show UAA console link to environment
def blink-uaa environment

end

#Grab ibmadmin password from Doctor
def ibmadmin environment

end

#Grab ibmuser password from Doctor
def ibmuser environment

end

#Grab vcap password from Doctor
def vcap environment

end

#Show important vcap commands
def vcap_commands

end

#List all environments
def envs
environments="```
+-----------------+-------------------------+\n
| *Name*            | *Deployment*              |\n
+-----------------+-------------------------+\n
| _Production_                                |\n
+-------------------------------------------+\n
| yp              | scas-yz-prod            |\n
| lyp             | eu-gb-prod              |\n
| sydney          | au-syd                  |\n
+-------------------------------------------+\n
| _Staging_                                   |\n
+-------------------------------------------+\n
| ys1             | scas-yz-stage1          |\n
| lys1            | eu-gb-stage1            |\n
| ys0             | yz-stage0               |\n
| yf              | yz-fabric               |\n
+-------------------------------------------+\n
| _Dedicated_                                 |\n
+-------------------------------------------+\n
| abnamro         | abnamro-eu-nl           |\n
| accenture       | acn                     |\n
| anz             | anz-au-south            |\n
| bendigo         | ben                     |\n
| bpi             | bpi-as-hk               |\n
| capgemini       | capgemini-eu-gb         |\n
| cio             | w3ibm-cio               |\n
| cognizant       | cognizant-as-sg         |\n
| csc             | csc-us-ne               |\n
| dfabric         | pci-na-south            |\n
| dgt             | dgt-eu-gb               |\n
| dvla            | dvla-eu-gb              |\n
| dys0            | dys0                    |\n
| gts             | gtsxaas-us-south        |\n
| hertz1          | hertz1-us-south         |\n
| hertz2          | hertz2-us-west          |\n
| infosys         | learninfy-as-sg         |\n
| jri             | jri-as-jp               |\n
| kaiser1         | kp1-us-west             |\n
| kaiser2         | kpsj002-us-west         |\n
| lloyds          | lbg-eu-gb               |\n
| monitise        | monitise                |\n
| mutua           | mutua-eu-gb             |\n
| nab             | nab-au-south            |\n
| niandc          | niandc-as-jp            |\n
| rbc             | rbc-ca-east             |\n
| showroom1       | sr1-us-south            |\n
| showroom2       | sr2-us-south            |\n
| showroom3       | sr3-us-south            |\n
| showroom4       | sr4-as-jp               |\n
| showroom5       | sr5-eu-gb               |\n
| showroom6       | sr6-us-south            |\n
| sncf            | sncf-eva-eu-fr          |\n
| sogeti          | sogeti                  |\n
| talentinsights  | talentinsights-ca-east  |\n
| talentinsights2 | talent2-eu-nl           |\n
| talentinsights3 | talent3-us-south        |\n
| talentinsights4 | ibmtalentinsights-eu-it |\n
| tcs             | tcs-us-south            |\n
| techmahindra    | techmahindra-as-sg      |\n
| ukpostoffice1   | postofficefot-eu-gb     |\n
| ukpostoffice2   | postofficefot2-eu-fr    |\n
| wipro           | wipro-as-sg             |\n
+-----------------+-------------------------+\n
```"
return environments
end
