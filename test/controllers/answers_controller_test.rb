require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, answer: { answercorrect: @answer.answercorrect, givenanswer: @answer.givenanswer, hintimageused: @answer.hintimageused, hintsemanticused: @answer.hintsemanticused, hintsentenceused: @answer.hintsentenceused, level: @answer.level, playtime: @answer.playtime, question_id: @answer.question_id, questionfinished: @answer.questionfinished, questionstarted: @answer.questionstarted, xp: @answer.xp }
    end

    assert_redirected_to answer_path(assigns(:answer))
  end

  test "should show answer" do
    get :show, id: @answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer
    assert_response :success
  end

  test "should update answer" do
    patch :update, id: @answer, answer: { answercorrect: @answer.answercorrect, givenanswer: @answer.givenanswer, hintimageused: @answer.hintimageused, hintsemanticused: @answer.hintsemanticused, hintsentenceused: @answer.hintsentenceused, level: @answer.level, playtime: @answer.playtime, question_id: @answer.question_id, questionfinished: @answer.questionfinished, questionstarted: @answer.questionstarted, xp: @answer.xp }
    assert_redirected_to answer_path(assigns(:answer))
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, id: @answer
    end

    assert_redirected_to answers_path
  end
end
