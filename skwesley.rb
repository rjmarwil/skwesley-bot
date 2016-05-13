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
      respond_message "skwesley blink <env> - Show console link to environment
skwesley blink_uaa <env> - Show UAA console link to environment
skwesley ibmadmin <env> - Grab ibmadmin password from Doctor
skwesley ibmuser <env> - Grab ibmuser password from Doctor
skwesley vcap <env> - Grab vcap password from Doctor
skwesley vcap - Show important vcap commands
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
def blink_uaa environment

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
+-----------------+-------------------------+
| Name            | Deployment              |
+-----------------+-------------------------+
| Production                                |
+-------------------------------------------+
| yp              | scas-yz-prod            |
| lyp             | eu-gb-prod              |
| sydney          | au-syd                  |
+-------------------------------------------+
| Staging                                   |
+-------------------------------------------+
| ys1             | scas-yz-stage1          |
| lys1            | eu-gb-stage1            |
| ys0             | yz-stage0               |
| yf              | yz-fabric               |
+-------------------------------------------+
| Dedicated                                 |
+-------------------------------------------+
| abnamro         | abnamro-eu-nl           |
| accenture       | acn                     |
| anz             | anz-au-south            |
| bendigo         | ben                     |
| bpi             | bpi-as-hk               |
| capgemini       | capgemini-eu-gb         |
| cio             | w3ibm-cio               |
| cognizant       | cognizant-as-sg         |
| csc             | csc-us-ne               |
| dfabric         | pci-na-south            |
| dgt             | dgt-eu-gb               |
| dvla            | dvla-eu-gb              |
| dys0            | dys0                    |
| gts             | gtsxaas-us-south        |
| hertz1          | hertz1-us-south         |
| hertz2          | hertz2-us-west          |
| infosys         | learninfy-as-sg         |
| jri             | jri-as-jp               |
| kaiser1         | kp1-us-west             |
| kaiser2         | kpsj002-us-west         |
| lloyds          | lbg-eu-gb               |
| monitise        | monitise                |
| mutua           | mutua-eu-gb             |
| nab             | nab-au-south            |
| niandc          | niandc-as-jp            |
| rbc             | rbc-ca-east             |
| showroom1       | sr1-us-south            |
| showroom2       | sr2-us-south            |
| showroom3       | sr3-us-south            |
| showroom4       | sr4-as-jp               |
| showroom5       | sr5-eu-gb               |
| showroom6       | sr6-us-south            |
| sncf            | sncf-eva-eu-fr          |
| sogeti          | sogeti                  |
| talentinsights  | talentinsights-ca-east  |
| talentinsights2 | talent2-eu-nl           |
| talentinsights3 | talent3-us-south        |
| talentinsights4 | ibmtalentinsights-eu-it |
| tcs             | tcs-us-south            |
| techmahindra    | techmahindra-as-sg      |
| ukpostoffice1   | postofficefot-eu-gb     |
| ukpostoffice2   | postofficefot2-eu-fr    |
| wipro           | wipro-as-sg             |
+-----------------+-------------------------+
```"
return environments
end
