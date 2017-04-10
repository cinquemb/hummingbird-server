require 'update_in_batches'

class AddTimeSpentToLibraryEntry < ActiveRecord::Migration
  using UpdateInBatches

  self.disable_ddl_transaction!

  def up
    say_with_time 'Filling time_spent null values' do
      LibraryEntry.where(time_spent: nil).update_in_batches(time_spent: 0)
    end

    change_column_default :library_entries, :time_spent, 0
    change_column_null :library_entries, :time_spent, false
  end

  def down
    remove_column :library_entries, :time_spent, :integer
  end
end
