class ItemsController < ApplicationController
		#attr_accessible  :name, :description, :price, :weight, :real
	
	before_filter  :find_item, only: [:show, :edit, :update, :destroy, :upvote]
	before_filter  :check_if_admin, only: [ :edit, :update, :new, :create, :destroy]
	def index
		#@items = Item.all
		@items = Item.where("price >= ?", params[:price_from]).order("vote_count DESC", "price").limit(3)
		#render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
	end
	def expensive
		@items = Item.where("price > 1000")	
		render "index"	
	end

# /items/1 GET
	def show
		#unless
		 @item
		#render "items/show"
		#render text: "page not founds", status: 404
		#render file: "/home/admina/Документи/Ruby_Files/Project/my_store/public/404"
		#render_404
			#end
	end

#  /items/new GET
	def new
	@item = Item.new	
	end

	# /items/1/edit GET
	def edit
		#@item = Item.find(params[:id])
		
	end
	# /items POST
	def create
		#render text: params.inspect
		ActionController::Parameters.permit_all_parameters = true
		#@item = Item.create(name: params[:name], description: params[:description], price: params[:price], real: params[:real], weight: params[:weight] )
		@item = Item.create(params.require(:item))
		#render  text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
		#puts @item.errors.full_messages
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end

	# /items/1 PUT
	def update
		ActionController::Parameters.permit_all_parameters = true
		#@item = Item.find(params[:id])
		@item.update_attributes(params.require(:item))
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			redirect_to item_path(@item)
		end
	end

	# /items/1 DELETE
	def destroy
		#@item = Item.find(params[:id])
		@item.destroy
		redirect_to action: "index"
	end

	def upvote
		@item.increment!(:vote_count)
		redirect_to action: :index
	end
	private

	def find_item
		#@item = Item.find(params[:id])
		@item = Item.where(id: params[:id]).first
		render_404 unless @item		
		
	end



end
