require 'test_helper'

class ProxyGenControllerTest < ActionDispatch::IntegrationTest
  test "should get entry" do
    get proxy_gen_entry_url
    assert_response :success
  end

  test "should get build" do
    get proxy_gen_build_url
    assert_response :success
  end

end
