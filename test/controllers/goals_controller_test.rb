require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal = goals(:one)
  end

  test "should get index" do
    get goals_url
    assert_response :success
  end

  test "should get new" do
    get new_goal_url
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post goals_url, params: { goal: { cantmeta: @goal.cantmeta, descripcion: @goal.descripcion, estado: @goal.estado, faltameta: @goal.faltameta, fecfin: @goal.fecfin, fecinicio: @goal.fecinicio, pagos_id: @goal.pagos_id } }
    end

    assert_redirected_to goal_url(Goal.last)
  end

  test "should show goal" do
    get goal_url(@goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_goal_url(@goal)
    assert_response :success
  end

  test "should update goal" do
    patch goal_url(@goal), params: { goal: { cantmeta: @goal.cantmeta, descripcion: @goal.descripcion, estado: @goal.estado, faltameta: @goal.faltameta, fecfin: @goal.fecfin, fecinicio: @goal.fecinicio, pagos_id: @goal.pagos_id } }
    assert_redirected_to goal_url(@goal)
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete goal_url(@goal)
    end

    assert_redirected_to goals_url
  end
end
