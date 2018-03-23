class Plugin < ApplicationRecord

  has_many :plugin_instances

  validates_uniqueness_of :name, message: '插件名称必须唯一'
  validates_uniqueness_of :appid, message: '插件的appid必须唯一'
  validates_presence_of :name, :appid, message: '不能为空'

  def current_version
    plugin_instances.current_version
  end
end
