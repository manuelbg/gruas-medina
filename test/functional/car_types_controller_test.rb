require 'test_helper'

class CarTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => CarType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    CarType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    CarType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to car_type_url(assigns(:car_type))
  end
  
  def test_edit
    get :edit, :id => CarType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    CarType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CarType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    CarType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CarType.first
    assert_redirected_to car_type_url(assigns(:car_type))
  end
  
  def test_destroy
    car_type = CarType.first
    delete :destroy, :id => car_type
    assert_redirected_to car_types_url
    assert !CarType.exists?(car_type.id)
  end
end
