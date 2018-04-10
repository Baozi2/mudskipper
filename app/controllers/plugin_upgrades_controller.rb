class PluginUpgradesController < ApplicationController
  before_action :set_plugin_upgrade, only: [:show, :edit, :update, :destroy]

  def index
    @plugin = Plugin.find(params[:plugin_id])
    @plugin_instance = PluginInstance.find(params[:plugin_instance_id])
    @plugin_upgrades = @plugin_instance.plugin_upgrades
  end

end
