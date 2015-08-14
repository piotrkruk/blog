class TagsController < ApplicationController
  def index
    @tags = Tag.where('name like ?', "#{params[:term]}%")
               .order(:name).limit(3)
  end
end
