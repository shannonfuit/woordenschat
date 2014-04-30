require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { ans1: @question.ans1, ans2: @question.ans2, ans3: @question.ans3, ans4: @question.ans4, anscorrect: @question.anscorrect, hintimage: @question.hintimage, hintsemantic: @question.hintsemantic, hintsentence: @question.hintsentence, level_id: @question.level_id, word: @question.word }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { ans1: @question.ans1, ans2: @question.ans2, ans3: @question.ans3, ans4: @question.ans4, anscorrect: @question.anscorrect, hintimage: @question.hintimage, hintsemantic: @question.hintsemantic, hintsentence: @question.hintsentence, level_id: @question.level_id, word: @question.word }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
