require 'test_helper'

class PluginUpgradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plugin_upgrade = plugin_upgrades(:one)
  end

  test "should get index" do
    get plugin_upgrades_url
    assert_response :success
  end

  test "should get new" do
    get new_plugin_upgrade_url
    assert_response :success
  end

  test "should create plugin_upgrade" do
    assert_difference('PluginUpgrade.count') do
      post plugin_upgrades_url, params: { plugin_upgrade: { ip: @plugin_upgrade.ip, os: @plugin_upgrade.os, plugin_instance_id: @plugin_upgrade.plugin_instance_id, version: @plugin_upgrade.version } }
    end

    assert_redirected_to plugin_upgrade_url(PluginUpgrade.last)
  end

  test "should show plugin_upgrade" do
    get plugin_upgrade_url(@plugin_upgrade)
    assert_response :success
  end

  test "should get edit" do
    get edit_plugin_upgrade_url(@plugin_upgrade)
    assert_response :success
  end

  test "should update plugin_upgrade" do
    patch plugin_upgrade_url(@plugin_upgrade), params: { plugin_upgrade: { ip: @plugin_upgrade.ip, os: @plugin_upgrade.os, plugin_instance_id: @plugin_upgrade.plugin_instance_id, version: @plugin_upgrade.version } }
    assert_redirected_to plugin_upgrade_url(@plugin_upgrade)
  end

  test "should destroy plugin_upgrade" do
    assert_difference('PluginUpgrade.count', -1) do
      delete plugin_upgrade_url(@plugin_upgrade)
    end

    assert_redirected_to plugin_upgrades_url
  end
end
