every '0 0 * * *' do
  runner "Movie.publish_check"
end
