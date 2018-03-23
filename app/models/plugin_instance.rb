require 'carrierwave/orm/activerecord'
require_relative '../uploaders/chrome_crx_uploader'
class PluginInstance < ApplicationRecord
  belongs_to :plugin
  has_many :plugin_upgrades

  scope :published, -> {where(published:  true)}

  attr_accessor :crx
  mount_uploader :path, ChromeCrxUploader

  def self.current_version
    published.take
  end
  def publish
    self.update(published: true)
    PluginInstance.where('plugin_id =? AND id != ? ', self.plugin_id, self.id).update_all(published: false)
  end
end
