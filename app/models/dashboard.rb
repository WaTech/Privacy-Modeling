class Dashboard
  attr_accessor :categories, :piis, :use_items, :category_ids, :pii_ids, :use_item_ids

  def initialize options

    @category_ids = options[:category_ids].select(&:present?) rescue []
    @pii_ids = options[:pii_ids].select(&:present?) rescue []
    @use_item_ids = options[:use_item_ids].select(&:present?) rescue []
    @categories = []
    @piis = []
    @use_items = []
  end

  def serialize
    { category_ids: category_ids, pii_ids: pii_ids, use_item_ids: use_item_ids }
  end

end
