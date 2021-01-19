require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest

  test 'should create shortener link' do
    assert_difference('Link.count') do
      post links_path,
           params: { url: 'https://gist.github.com/cfanpnk/3e29ff807be44558acda06f6bce763a1' }
    end
  end

  test 'should show link' do
      get link_path(links(:one))
      assert_response :success
  end

end
