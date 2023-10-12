require 'test_helper'

class OpenGovPrinciplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_gov_principle = open_gov_principles(:one)
  end

  test "should get index" do
    get open_gov_principles_url, as: :json
    assert_response :success
  end

  test "should create open_gov_principle" do
    assert_difference('OpenGovPrinciple.count') do
      post open_gov_principles_url, params: { open_gov_principle: { accessible: @open_gov_principle.accessible, complete: @open_gov_principle.complete, primary: @open_gov_principle.primary } }, as: :json
    end

    assert_response 201
  end

  test "should show open_gov_principle" do
    get open_gov_principle_url(@open_gov_principle), as: :json
    assert_response :success
  end

  test "should update open_gov_principle" do
    patch open_gov_principle_url(@open_gov_principle), params: { open_gov_principle: { accessible: @open_gov_principle.accessible, complete: @open_gov_principle.complete, primary: @open_gov_principle.primary } }, as: :json
    assert_response 200
  end

  test "should destroy open_gov_principle" do
    assert_difference('OpenGovPrinciple.count', -1) do
      delete open_gov_principle_url(@open_gov_principle), as: :json
    end

    assert_response 204
  end
end
