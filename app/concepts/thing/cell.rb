class Thing::Cell < Cell::Concept
  property :name
  property :created_at

  def show
    render
  end

  private
  def name_link
    link_to name, thing_path(model)
  end

  def classes
    classes = ['large-3', 'columns']
    classes << 'end' if options[:last] == model
    classes
  end
end
