every 2.hours do
  rake episcopal_news:update
end

every :reboot do
  rake episcopal_news:update
end