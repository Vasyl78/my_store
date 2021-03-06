class ItemsController < ApplicationController
		#attr_accessible  :name, :description, :price, :weight, :real
	
	before_filter  :find_item, only: [:show, :edit, :update, :destroy, :upvote]
	before_filter  :check_if_admin, only: [ :edit, :update, :new, :create, :destroy]
	def index
		#@items = Item.all
		@items = Item
		@items = @items.where("price >= ?", params[:price_from]) if params[:price_from]
		@items = @items.where("created_at >= ?", 1.day.ago)      if params[:today]
		@items = @items.where("vote_count >= ?", params[:votes_from])      if params[:votes_from]
		@items = @items.order("vote_count DESC", "price")
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
		@item = Item.create(item_params)
		#render text: params.inspect
		#@item = Item.create(name: params[:name], description: params[:description], price: params[:price], real: params[:real], weight: params[:weight] )
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
		#@item = Item.find(params[:id])
		@item.update_attributes(item_params)
		if @item.errors.empty?
			flash.now[:success] = "Item successfully updated!"
			redirect_to item_path(@item)
		else
			flash.now[:error] = "You made mistakes in your form! Please correct them."
			render "edit"
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

	def item_params
		params.require(:item).permit(:price, :weight, :real, :name, :description, :image)
		
	end



end
