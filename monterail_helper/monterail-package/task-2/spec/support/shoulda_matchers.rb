Shoulda::Matchers.configure do |con|
  con.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end
