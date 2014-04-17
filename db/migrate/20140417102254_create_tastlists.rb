class CreateTastlists < ActiveRecord::Migration
  def change
    
    # drop
    if table_exists?( :tasklists )
      drop_table :tasklists
    end
    
    # create
    create_table :tasklists do |t|
      t.string    :name,      null: false, default: ''
      t.string    :detail,    null: false, default: ''
      t.integer   :progress,  null: false, default: 0
      t.timestamp :updated,   null: false, default: '0000-00-00 00:00:00'
    end
    
    # add index
    add_index :tasklists, [ :id, :name ],    unique: true, name: 'key01'
    add_index :tasklists, [ :id, :updated ], name: 'key02'
    add_index :tasklists, [ :progress ],     name: 'key03'
    
  end
end
