xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title("CannedCukes: Latest Cucumber scenarios")
    xml.link("http://cannedcukes.heroku.com/")
    xml.description("Sharing your cucumber features with others")
    xml.language('en-us')
      @scenarios.each do |scenario|
        xml.item do
          xml.title(scenario.title)
          xml.description(scenario.body)      
          xml.author(scenario.feature.user.login)               
          xml.pubDate(scenario.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.link(user_feature_scenario_url(scenario.feature.user, scenario.feature, scenario))
          xml.guid(user_feature_scenario_url(scenario.feature.user, scenario.feature, scenario))
        end
      end
  end
end
