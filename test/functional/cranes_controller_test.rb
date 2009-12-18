require 'test_helper'

class CranesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Crane.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Crane.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Crane.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to crane_url(assigns(:crane))
  end
  
  def test_edit
    get :edit, :id => Crane.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Crane.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Crane.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Crane.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Crane.first
    assert_redirected_to crane_url(assigns(:crane))
  end
  
  def test_destroy
    crane = Crane.first
    delete :destroy, :id => crane
    assert_redirected_to cranes_url
    assert !Crane.exists?(crane.id)
  end
end
