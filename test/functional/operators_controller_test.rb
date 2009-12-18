require 'test_helper'

class OperatorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Operator.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Operator.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Operator.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to operator_url(assigns(:operator))
  end
  
  def test_edit
    get :edit, :id => Operator.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Operator.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Operator.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Operator.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Operator.first
    assert_redirected_to operator_url(assigns(:operator))
  end
  
  def test_destroy
    operator = Operator.first
    delete :destroy, :id => operator
    assert_redirected_to operators_url
    assert !Operator.exists?(operator.id)
  end
end
