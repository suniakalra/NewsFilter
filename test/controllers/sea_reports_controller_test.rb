require 'test_helper'

class SeaReportsControllerTest < ActionController::TestCase
  setup do
    @sea_report = sea_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sea_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sea_report" do
    assert_difference('SeaReport.count') do
      post :create, sea_report: {  }
    end

    assert_redirected_to sea_report_path(assigns(:sea_report))
  end

  test "should show sea_report" do
    get :show, id: @sea_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sea_report
    assert_response :success
  end

  test "should update sea_report" do
    patch :update, id: @sea_report, sea_report: {  }
    assert_redirected_to sea_report_path(assigns(:sea_report))
  end

  test "should destroy sea_report" do
    assert_difference('SeaReport.count', -1) do
      delete :destroy, id: @sea_report
    end

    assert_redirected_to sea_reports_path
  end
end
