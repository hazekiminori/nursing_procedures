require "test_helper"

class ProcedureCategoryRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_user" do
    get procedure_category_relations_add_user_url
    assert_response :success
  end
end
