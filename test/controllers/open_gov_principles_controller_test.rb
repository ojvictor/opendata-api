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
      post open_gov_principles_url, params: { open_gov_principle: { commonly_owned_or_open_standards: @open_gov_principle.commonly_owned_or_open_standards, completeness: @open_gov_principle.completeness, easy_phisical_or_eletronic_access: @open_gov_principle.easy_phisical_or_eletronic_access, licensing: @open_gov_principle.licensing, machine_readability: @open_gov_principle.machine_readability, non_discrimination: @open_gov_principle.non_discrimination, permanence: @open_gov_principle.permanence, primacy: @open_gov_principle.primacy, site_id: @open_gov_principle.site_id, timeliness: @open_gov_principle.timeliness, usage_costs: @open_gov_principle.usage_costs } }, as: :json
    end

    assert_response 201
  end

  test "should show open_gov_principle" do
    get open_gov_principle_url(@open_gov_principle), as: :json
    assert_response :success
  end

  test "should update open_gov_principle" do
    patch open_gov_principle_url(@open_gov_principle), params: { open_gov_principle: { commonly_owned_or_open_standards: @open_gov_principle.commonly_owned_or_open_standards, completeness: @open_gov_principle.completeness, easy_phisical_or_eletronic_access: @open_gov_principle.easy_phisical_or_eletronic_access, licensing: @open_gov_principle.licensing, machine_readability: @open_gov_principle.machine_readability, non_discrimination: @open_gov_principle.non_discrimination, permanence: @open_gov_principle.permanence, primacy: @open_gov_principle.primacy, site_id: @open_gov_principle.site_id, timeliness: @open_gov_principle.timeliness, usage_costs: @open_gov_principle.usage_costs } }, as: :json
    assert_response 200
  end

  test "should destroy open_gov_principle" do
    assert_difference('OpenGovPrinciple.count', -1) do
      delete open_gov_principle_url(@open_gov_principle), as: :json
    end

    assert_response 204
  end
end
