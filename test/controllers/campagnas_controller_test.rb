require 'test_helper'

class CampagnasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campagna = campagnas(:one)
  end

  test "should get index" do
    get campagnas_url
    assert_response :success
  end

  test "should get new" do
    get new_campagna_url
    assert_response :success
  end

  test "should create campagna" do
    assert_difference('Campagna.count') do
      post campagnas_url, params: { campagna: { meta_id: @campagna.meta_id, nombre: @campagna.nombre, pagos_id: @campagna.pagos_id } }
    end

    assert_redirected_to campagna_url(Campagna.last)
  end

  test "should show campagna" do
    get campagna_url(@campagna)
    assert_response :success
  end

  test "should get edit" do
    get edit_campagna_url(@campagna)
    assert_response :success
  end

  test "should update campagna" do
    patch campagna_url(@campagna), params: { campagna: { meta_id: @campagna.meta_id, nombre: @campagna.nombre, pagos_id: @campagna.pagos_id } }
    assert_redirected_to campagna_url(@campagna)
  end

  test "should destroy campagna" do
    assert_difference('Campagna.count', -1) do
      delete campagna_url(@campagna)
    end

    assert_redirected_to campagnas_url
  end
end
