# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  buyer_id   :integer
#  total      :integer
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  attr_accessible :total, :active, :buyer_id, :updated_at

  def old?(limit=7.day) # default value is 7
    (self.created_at < limit.ago)
  end

  def deactivate
    self.update_attribute(:active, false)
  end

  def activate
    self.update_attribute(:active, true)
  end

  def check(limit= 2.day)
    if self.old?(limit)
      self.deactivate
    end
  end 
 
  def self.find_old(limit = 1.day)
    @old_orders = self.where(:created_at => Time.at(0)..(Time.now - limit)) 
  end

  def self.find_expensive(limit1 = 10000, limit2 = 20000)
    @expensive_orders = self.where(:total => limit1..limit2)
  end

  def self.deactivate_old(limit = 1.day)
    self.find_old(limit)
    @old_orders.each { |order| order.deactivate }
  end

      
end
