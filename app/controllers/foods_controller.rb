class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user)
  end
  def new
    @food = Food.new
    @user = current_user
  end
  def create
    @food = Food.new(params.require(:food).permit(:name, :measurement_unit, :price, :quantity))
    puts 'the food is'
    puts @food.inspect
    @food.user_id = current_user.id
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food saved'
          redirect_to foods_url
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end
end
