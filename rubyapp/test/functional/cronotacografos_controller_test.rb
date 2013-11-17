require 'test_helper'

class CronotacografosControllerTest < ActionController::TestCase
  setup do
    @cronotacografo = cronotacografos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cronotacografos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cronotacografo" do
    assert_difference('Cronotacografo.count') do
      post :create, cronotacografo: { constante_k: @cronotacografo.constante_k, km: @cronotacografo.km, marca: @cronotacografo.marca, modelo: @cronotacografo.modelo, num_serie: @cronotacografo.num_serie }
    end

    assert_redirected_to cronotacografo_path(assigns(:cronotacografo))
  end

  test "should show cronotacografo" do
    get :show, id: @cronotacografo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cronotacografo
    assert_response :success
  end

  test "should update cronotacografo" do
    put :update, id: @cronotacografo, cronotacografo: { constante_k: @cronotacografo.constante_k, km: @cronotacografo.km, marca: @cronotacografo.marca, modelo: @cronotacografo.modelo, num_serie: @cronotacografo.num_serie }
    assert_redirected_to cronotacografo_path(assigns(:cronotacografo))
  end

  test "should destroy cronotacografo" do
    assert_difference('Cronotacografo.count', -1) do
      delete :destroy, id: @cronotacografo
    end

    assert_redirected_to cronotacografos_path
  end
end
