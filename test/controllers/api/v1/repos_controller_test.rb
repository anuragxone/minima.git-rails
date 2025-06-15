require "test_helper"

class Api::V1::ReposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_repo = api_v1_repos(:one)
  end

  test "should get index" do
    get api_v1_repos_url, as: :json
    assert_response :success
  end

  test "should create api_v1_repo" do
    assert_difference("Api::V1::Repo.count") do
      post api_v1_repos_url, params: { api_v1_repo: {} }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_repo" do
    get api_v1_repo_url(@api_v1_repo), as: :json
    assert_response :success
  end

  test "should update api_v1_repo" do
    patch api_v1_repo_url(@api_v1_repo), params: { api_v1_repo: {} }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_repo" do
    assert_difference("Api::V1::Repo.count", -1) do
      delete api_v1_repo_url(@api_v1_repo), as: :json
    end

    assert_response :no_content
  end
end
