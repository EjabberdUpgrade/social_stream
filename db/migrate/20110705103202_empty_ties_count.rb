class EmptyTiesCount < ActiveRecord::Migration
  def up
    change_column :contacts, :ties_count, :integer, :default => 0

    Contact.record_timestamps = false
    Contact.all.each do |c|
      c.update_attribute(:ties_count, 0) if c.ties_count.nil?
    end
  end

  def down
  end
end
