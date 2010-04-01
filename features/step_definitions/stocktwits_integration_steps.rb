Given /^the following stocktwits_integrations:$/ do |stocktwits_integrations|
  StocktwitsIntegration.create!(stocktwits_integrations.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) stocktwits_integration$/ do |pos|
  visit stocktwits_integrations_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following stocktwits_integrations:$/ do |expected_stocktwits_integrations_table|
  expected_stocktwits_integrations_table.diff!(tableish('table tr', 'td,th'))
end


# ["$IMAX is literally creaping twords that 18 mark. Watch for a move once it does", "$CNAM performing well. I love this one in my IRA since $5.08. Think this one will be a triple/quad bagger over the next year for me.", "-.05 on $ENCO", "watch $spy resistance here", "$RIMM not done yet waiting for another entry", "RT @alleyinsider: Google Investor: Google Will Eventually \"Own\" The Smartphone Market $GOOG by @hleonard76 http://bit.ly/bmgN8w", "Cumulative TICK trading in the -7,500 area, 2nd worst performance of last 30 days at this time. $$", "out $ENCO", "what is lifetime performance? RT @StockTwits: Check out @thinkingtrades March performance update. He's been crushing it for his subs $$", "http://chart.ly/ph6msy $GOOG - cont. to short this one today - trade only", "With NYSE stocks like $AEN, it's definitely a possibility that the specialist may try to take out stops. It's not a conspiracy theory.", "Damn it!!! I was so busy watching my positions (I usually only have one or two) that I totally missed the $WFR !!  Beautiful..", "$MOT I&#39;ve found ChangeWave research to be ahead of curve by 1-2 months. Android taking share from $RIMM http://stk.ly/bPg6Cn", "$CEG - Constellation Energy Group - Long term stock chart : http://bit.ly/ceg-stock", "http://chart.ly/h75zx5 $GS - breaks this support trendline will add to short -", "RT @hedgieguy: Who needs $ADBE flash? ...... http://bit.ly/c3jlk6 ** can see this one ending in a surprise detente", "I have no position in $RIMM but will watch morning for opportunity to buy puts if this has good earnings.", "$FONR @2.00", "@Blano You love macbooks, PBR, beards, and you hate your job. Just become a hippy already. hehe jk $$", "took some $ENCO 4.18 too fast...", "$RIMM might have good earnings, but will there be sellers within 15 minutes of open?  Will they really hold if $AAPL iPhone coming to $VZ?", "Picked up 1,000 shares of $MPEL at 4.70 this is an addition to a longer term position. My next buy will be at 4.50 if needed", "@lplongo I did say buy $DTO @ 85, i'd wait for it to gt passed 83. again if ya missed the opportunity", "Negative TICKscore has coincided with lower $SPX 77% of the time last 5 yrs. Average loss 1.3%, avg gain 0.5% $$", "$zb_f long at 115^15", "@lplongo u got me... any rally buy $DTO on pause...", "@Urbane_Gorilla same formaldehyde effect (amongst others) walking into any $WMT store", "Keep an eye on $IMAX. been very strong and has shown less volatility to the downside than in the past. could be preparing for a strong move.", "Been daytrading $ENCO today.  Showing support at 83% then has small jumps to 4.00 or 91%", "Been daytrading $ENCO today.  Showing support at 83% then has small jumps to 4.00 or 91%"]
