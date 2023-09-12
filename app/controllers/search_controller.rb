class SearchController < ApplicationController
  def index
    if params[:q]
      sanitized_query = "%" + ActiveRecord::Base::sanitize_sql_like(params[:q]) + "%"
      @projects = current_user.projects.where("title ILIKE ?", sanitized_query)
      @tasks = current_user.tasks.where("title ILIKE ?", sanitized_query)
      @tags = current_user.tags.where("title ILIKE ?", sanitized_query)
    end
  end
end
