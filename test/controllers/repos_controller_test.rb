require "test_helper"

class ReposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repo = repos(:one)
  end

  test "should get index" do
    get repos_url, as: :json
    assert_response :success
  end

  test "should create repo" do
    assert_difference("Repo.count") do
      post repos_url, params: { repo: { name: @repo.name, slug: @repo.slug, user_id: @repo.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show repo" do
    get repo_url(@repo), as: :json
    assert_response :success
  end

  test "should update repo" do
    patch repo_url(@repo), params: { repo: { name: @repo.name, slug: @repo.slug, user_id: @repo.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy repo" do
    assert_difference("Repo.count", -1) do
      delete repo_url(@repo), as: :json
    end

    assert_response :no_content
  end
end
