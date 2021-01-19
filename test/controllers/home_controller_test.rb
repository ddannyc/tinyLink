require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
    assert_match 'Home#index', @response.body
  end

  test 'should link redirect success' do
    url = Base64.urlsafe_encode64('https://gist.github.com/cfanpnk/3e29ff807be44558acda06f6bce763a1')
    code = SecureRandom.alphanumeric(7).downcase
    link = Link.create(url_code: code, origin_url: url, expire_at: Time.now + 5.minutes)
    view_count = link.view_count
    get code_path(link.url_code)
    assert_response :found
    assert_equal view_count + 1, link.reload.view_count
  end

  test 'should expires link render not found' do
    link = links(:one)
    view_count = link.view_count
    get code_path(link.url_code)
    assert_response :not_found
    assert_not_equal view_count + 1, link.reload.view_count
  end
end
