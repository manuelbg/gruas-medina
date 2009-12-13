require 'test_helper'

class CarBrandsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => CarBrand.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    CarBrand.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    CarBrand.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to car_brand_url(assigns(:car_brand))
  end
  
  def test_edit
    get :edit, :id => CarBrand.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    CarBrand.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CarBrand.first
    assert_template 'edit'
  end
  
  def test_update_valid
    CarBrand.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CarBrand.first
    assert_redirected_to car_brand_url(assigns(:car_brand))
  end
  
  def test_destroy
    car_brand = CarBrand.first
    delete :destroy, :id => car_brand
    assert_redirected_to car_brands_url
    assert !CarBrand.exists?(car_brand.id)
  end
end
