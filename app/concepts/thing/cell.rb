class Thing::Cell < Cell::Concept
  property :name
  property :created_at

  def show
    render
  end

  class Grid < Cell::Concept
    def show
      things = Thing.latest
      concept('thing/cell', collection: things, last: things.last)
    end
  end

  private
  def name_link
    link_to name, thing_path(model)
    # link_to 'test', '/test' 
  end

  def classes
    classes = ['large-3', 'columns']
    classes << 'end' if options[:last] == model
    classes
  end
end
