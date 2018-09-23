class PostsForBranchService

  def initialize(params)
    @branch = params[:branch]
    @search = params[:search]
    @category = params[:category]
  end

  def call
    if @category.blank? && @search.blank?
      Post.by_branch(@branch).all
    elsif @category.blank? && @search.present?
      Post.by_branch(@branch).search(@search)
    elsif @category.present? && @search.blank?
      Post.by_category(@branch, @category)
    elsif @category.present? && @search.present?
      Post.by_category(@branch, @category).search(@search)
    else
    end
  end
end