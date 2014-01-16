class MailesController < ApplicationController
  before_filter :authenticate_user!
 
 def index
  @search = current_user.mailes.search(params[:q])
  @search.build_condition
  @mailes = @search.result(distinct: true)
 end
 
  def new
    @maile = current_user.mailes.build
  end
  
  def create
    
    @maile = current_user.mailes.new(params[:maile])
    if @maile.save
      redirect_to mailes_path
    else
      render 'new'
    end
  end

  def destroy
    @maile = Maile.find(params[:id])
    @maile.destroy
    redirect_to mailes_path
  end
  
  def edit
    @maile = Maile.find(params[:id])
  end

  def update
    #@maile = current_user.mailes(params[:id])
    @maile = Maile.find(params[:id])
    if @maile.update_attributes(params[:maile])
      redirect_to mailes_path
    else
      render 'edit'     
    end
  end
  
  def show
    @maile = Maile.find(params[:id])
    if params[:token]
      if params[:token] == @maile.token
        @maile.seened = true
        @maile.save
      end
    end
  end

  def pending_mail
  @mailes = current_user.mailes.pending_mail.paginate(:page => params[:page], :per_page => 10)
  end
end
