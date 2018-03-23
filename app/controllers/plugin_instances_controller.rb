require 'pathname'
class PluginInstancesController < ApplicationController
  before_action :set_plugin, only: [:index, :new, :create, :edit, :update]
  before_action :set_plugin_instance, only: [:show, :edit, :update, :destroy]

  # GET /plugin_instances
  # GET /plugin_instances.json
  def index
    @plugin_instances = PluginInstance.where(plugin_id: params[:plugin_id]).order(created_at: :desc)
  end

  def show
  end

  def new
    @plugin_instance = PluginInstance.new
  end

  def edit
  end

  def create

    @plugin_instance = PluginInstance.new(plugin_instance_params)
    @plugin_instance.path = plugin_instance_params[:crx]
    respond_to do |format|
      if @plugin_instance.save
        @plugin_instance.publish
        format.html { redirect_to plugin_plugin_instances_path(@plugin), notice: 'Plugin instance was successfully created.' }
        format.json { render :show, status: :created, location: @plugin_instance }
      else
        format.html { render :new }
        format.json { render json: @plugin_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @plugin_instance.update(plugin_instance_params)
        format.html { redirect_to @plugin_instance, notice: 'Plugin instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @plugin_instance }
      else
        format.html { render :edit }
        format.json { render json: @plugin_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plugin_instance.destroy
    respond_to do |format|
      format.html { redirect_to plugin_instances_url, notice: 'Plugin instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_plugin
      @plugin = Plugin.find(params[:plugin_id])
    end

    def set_plugin_instance
      @plugin_instance = PluginInstance.find(params[:id])
    end

    def plugin_instance_params
      params.require(:plugin_instance).permit(:version, :description, :plugin_id, :crx)
    end

    # def save_crx
    #   crx_name = @plugin.name + '_' + plugin_instance_params[:version] + '.crx'
    #   crx = Pathname.new("#{Rails.root}/public").join(@plugin.name, crx_name)
    #   crx.open('w:ASCII-8BIT') do|file|
    #     file.write(plugin_instance_params[:crx].read)
    #   end
    #   {path: crx.to_s}
    # end
end
