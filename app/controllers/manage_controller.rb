class ManageController < ApplicationController
  
  PAGE_LIMIT = 5
  
  def initialize
    super
    @task = Tasklist
  end
  
=begin
  #=======================================
  # path:     /
  # methods:  get, post
  # params:   page      String or Nil
  #=======================================
=end
  def select
    # set local variable
    setPageNum()
    loadTaskList()
    
    
    
    
    render :json => @tasklist.to_json if request.post?
    
  end

=begin
  #=======================================
  # path:     /make
  # methods:  get, post
  # params:   page      String or Nil
  #           uid       String
  #           name      String
  #           detail    String
  #=======================================
=end
  def add
    # set local variable
    setPageNum()

    # get each params
    args = { uid: nil, name: nil, detail: nil }
    args.each{| ( key, vol ) |
      args[ key ] = params[ key.to_s ] if params.has_key?( key.to_s )
    }
    
    #p args
    if args.values.compact.size == args.size
    end
    
    render :json => params.to_json
  end
  
=begin
  #=======================================
  # path:     /change
  # methods:  post
  # params:   page      String or Nil
  #           id        String
  #           progress  String
  #=======================================
=end
  def change
    # set local variable
    setPageNum()
  end
  
=begin
  #=======================================
  # path:     /del
  # methods:  post
  # params:   page      String or Nil
  #           id        String
  #=======================================
=end
  def del
    # set local variable
    setPageNum()
  end
  
=begin
  #=======================================
  # path:     /load
  # methods:  post
  # params:   page      String
  #=======================================
=end
  def load
    # set local variable
    setPageNum()
  end
  
  private
  def setPageNum
    page = 0
    page = params[ 'page' ].to_i if params.has_key?( 'page' )
    
    # set local variable
    @limit  = PAGE_LIMIT
    @offset = page * @limit
  end
  
  def loadTaskList
    @tasklist = Tasklist.order( :id ).offset( @offset ).take( @limit )
  end
end
