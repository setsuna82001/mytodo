class ManageController < ApplicationController
  
  PAGE_LIMIT = 30
  
=begin
  #=======================================
  # path:     /
  # methods:  get, post
  # params:   page      Fixnum or Nil
  #=======================================
=end
  def select
    # set local variable
    setPageNum()
    
    # 
    response = []
    task = Tasklist.new
    
    response = Tasklist.order( :id ).take( 1 )
    
    
    render :json => response.to_json if request.post?
    render :json => response.to_json
  end

=begin
  #=======================================
  # path:     /make
  # methods:  get, post
  # params:   page      Fixnum or Nil
  #           uid       Fixnum
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
  # params:   page      Fixnum or Nil
  #           id        Fixnum
  #           progress  Fixnum
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
  # params:   page      Fixnum or Nil
  #           id        Fixnum
  #=======================================
=end
  def del
    # set local variable
    setPageNum()
  end
  
  
  private
  def setPageNum
    page = 0
    page = params[ 'page' ] if params.has_key?( 'page' )
    
    # set local variable
    @limit  = self::PAGE_LIMIT
    @offset = page * @limit
  end

end
