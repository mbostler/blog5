require 'test_helper'

class HomepagePicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homepage_pic = homepage_pics(:one)
  end

  test "should get index" do
    get homepage_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_homepage_pic_url
    assert_response :success
  end

  test "should create homepage_pic" do
    assert_difference('HomepagePic.count') do
      post homepage_pics_url, params: { homepage_pic: { alt_text: @homepage_pic.alt_text, content: @homepage_pic.content } }
    end

    assert_redirected_to homepage_pic_url(HomepagePic.last)
  end

  test "should show homepage_pic" do
    get homepage_pic_url(@homepage_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_homepage_pic_url(@homepage_pic)
    assert_response :success
  end

  test "should update homepage_pic" do
    patch homepage_pic_url(@homepage_pic), params: { homepage_pic: { alt_text: @homepage_pic.alt_text, content: @homepage_pic.content } }
    assert_redirected_to homepage_pic_url(@homepage_pic)
  end

  test "should destroy homepage_pic" do
    assert_difference('HomepagePic.count', -1) do
      delete homepage_pic_url(@homepage_pic)
    end

    assert_redirected_to homepage_pics_url
  end
end
