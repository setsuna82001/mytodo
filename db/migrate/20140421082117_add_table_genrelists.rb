class AddTableGenrelists < ActiveRecord::Migration
  def change
    
    # drop
    if table_exists?( :genrelists )
      drop_table :genrelists
    end
    
    # create
    create_table :genrelists do |t|
      t.string    :name,      null: false, default: ''
      t.timestamp :updated,   null: false, default: '0000-00-00 00:00:00'
    end
    
    # add index
    add_index :genrelists, [ :id, :name ],    unique: true, name: 'key01'
    add_index :genrelists, [ :id, :updated ], name: 'key02'
    
  end
end
