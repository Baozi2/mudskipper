require 'test_helper'

class PluginInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plugin_instance = plugin_instances(:one)
  end

  test "should get index" do
    get plugin_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_plugin_instance_url
    assert_response :success
  end

  test "should create plugin_instance" do
    assert_difference('PluginInstance.count') do
      post plugin_instances_url, params: { plugin_instance: { path: @plugin_instance.path, plugin_id: @plugin_instance.plugin_id, published: @plugin_instance.published, version: @plugin_instance.version } }
    end

    assert_redirected_to plugin_instance_url(PluginInstance.last)
  end

  test "should show plugin_instance" do
    get plugin_instance_url(@plugin_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_plugin_instance_url(@plugin_instance)
    assert_response :success
  end

  test "should update plugin_instance" do
    patch plugin_instance_url(@plugin_instance), params: { plugin_instance: { path: @plugin_instance.path, plugin_id: @plugin_instance.plugin_id, published: @plugin_instance.published, version: @plugin_instance.version } }
    assert_redirected_to plugin_instance_url(@plugin_instance)
  end

  test "should destroy plugin_instance" do
    assert_difference('PluginInstance.count', -1) do
      delete plugin_instance_url(@plugin_instance)
    end

    assert_redirected_to plugin_instances_url
  end
end
