require 'test_helper'

class PlayedlevelsControllerTest < ActionController::TestCase
  setup do
    @playedlevel = playedlevels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playedlevels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playedlevel" do
    assert_difference('Playedlevel.count') do
      post :create, playedlevel: { correctquestions: @playedlevel.correctquestions, finishlevel: @playedlevel.finishlevel, level_id: @playedlevel.level_id, levelcompleted: @playedlevel.levelcompleted, levelxp: @playedlevel.levelxp, playtime: @playedlevel.playtime, stars: @playedlevel.stars, startlevel: @playedlevel.startlevel, user_id: @playedlevel.user_id }
    end

    assert_redirected_to playedlevel_path(assigns(:playedlevel))
  end

  test "should show playedlevel" do
    get :show, id: @playedlevel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playedlevel
    assert_response :success
  end

  test "should update playedlevel" do
    patch :update, id: @playedlevel, playedlevel: { correctquestions: @playedlevel.correctquestions, finishlevel: @playedlevel.finishlevel, level_id: @playedlevel.level_id, levelcompleted: @playedlevel.levelcompleted, levelxp: @playedlevel.levelxp, playtime: @playedlevel.playtime, stars: @playedlevel.stars, startlevel: @playedlevel.startlevel, user_id: @playedlevel.user_id }
    assert_redirected_to playedlevel_path(assigns(:playedlevel))
  end

  test "should destroy playedlevel" do
    assert_difference('Playedlevel.count', -1) do
      delete :destroy, id: @playedlevel
    end

    assert_redirected_to playedlevels_path
  end
end
