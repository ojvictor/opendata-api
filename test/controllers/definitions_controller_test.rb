require 'test_helper'

class DefinitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @definition = definitions(:one)
  end

  test "should get index" do
    get definitions_url, as: :json
    assert_response :success
  end

  test "should create definition" do
    assert_difference('Definition.count') do
      post definitions_url, params: { definition: { attribute: @definition.attribute, description: @definition.description, name: @definition.name } }, as: :json
    end

    assert_response 201
  end

  test "should show definition" do
    get definition_url(@definition), as: :json
    assert_response :success
  end

  test "should update definition" do
    patch definition_url(@definition), params: { definition: { attribute: @definition.attribute, description: @definition.description, name: @definition.name } }, as: :json
    assert_response 200
  end

  test "should destroy definition" do
    assert_difference('Definition.count', -1) do
      delete definition_url(@definition), as: :json
    end

    assert_response 204
  end
end
