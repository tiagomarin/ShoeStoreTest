# rubocop:disable all

module FilterProducts
  def clear_filters
    return unless params[:clear_filters].present?

    session[:query] = nil
    session[:size_filters] = nil
    session[:color_filters] = nil
    session[:brand_filters] = nil
    session[:category_filters] = nil
    session[:min_price_filter] = nil
    session[:max_price_filter] = nil
  end

  # save in session the filters that the user selected
  def save_filter_in_session
    session[:query] = params[:query] if params[:query].present? && params[:query] != ''
    if params[:size_filter].present?
      if session[:size_filters].nil?
        session[:size_filters] = params[:size_filter]
      elsif !session[:size_filters].include?(params[:size_filter])
        session[:size_filters] += " #{params[:size_filter]}"
      end
    end
    if params[:gender_filter].present?
      if session[:gender_filters].nil? || session[:gender_filters].empty?
        session[:gender_filters] = params[:gender_filter].downcase
      elsif !session[:gender_filters].include?(params[:gender_filter].downcase)
        session[:gender_filters] += " #{params[:gender_filter].downcase}"
      end
    end
    if params[:color_filter].present?
      if session[:color_filters].nil? || session[:color_filters].empty?
        session[:color_filters] = params[:color_filter].downcase
      elsif !session[:color_filters].include?(params[:color_filter].downcase)
        session[:color_filters] += " #{params[:color_filter].downcase}"
      end
    end
    if params[:brand_filter].present?
      if session[:brand_filters].nil?
        session[:brand_filters] = params[:brand_filter].downcase
      elsif !session[:brand_filters].include?(params[:brand_filter].downcase)
        session[:brand_filters] += " #{params[:brand_filter].downcase}"
      end
    end
    if params[:category_filter].present?
      if session[:category_filters].nil?
        session[:category_filters] = params[:category_filter].downcase
      elsif !session[:category_filters].include?(params[:category_filter].downcase)
        session[:category_filters] += " #{params[:category_filter].downcase}"
      end
    end
    if params[:min_price_filter].present? && params[:min_price_filter] != ''
      session[:min_price_filter] =
        params[:min_price_filter]
    end

    return unless params[:max_price_filter].present? && params[:max_price_filter] != ''

    session[:max_price_filter] =
      params[:max_price_filter]
  end

  # get all products that have something related to what the user searched for
  def search_products
    if params[:query].present? && session[:query] != ''
      queries = session[:query].downcase.split # split query into array of words
      @products = []
      # add all results from database search to @products without duplicates
      queries.each do |query|
        @products |= Product.where(archived: false).where('lower(name) LIKE ?', "%#{query}%")
        @products |= Product.where(archived: false).where('lower(description) LIKE ?', "%#{query}%")
        @products |= Product.where(archived: false).joins(:brand).where('lower(brands.name) LIKE ?', "%#{query}%")
        @products |= Product.where(archived: false).joins(:color).where('lower(colors.name) LIKE ?', "%#{query}%")
        @products |= Product.where(archived: false).joins(:gender).where('lower(genders.name) LIKE ?', "%#{query}%")
        @products |= Product.where(archived: false).joins(:size).where('sizes.number = ?', query.to_f)
        @products |= Product.where(archived: false).joins(:collection).where('lower(collections.name) LIKE ?', "%#{query}%")
        @products |= Product.where(archived: false).joins(:category).where('lower(categories.name) LIKE ?', "%#{query}%")
      end
    else
      @products = Product.where(archived: false)
    end
    @products
  end

  # get all products without duplicates based on size
  def remove_duplicates(products)
    products_no_repeat = []
    products.each do |product|
      products_no_repeat << product unless products_no_repeat.any? do |p|
                                             p.name == product.name &&
                                             p.brand.name == product.brand.name &&
                                             p.color.name == product.color.name
                                           end
    end
    products_no_repeat
  end

  # ----------- Update filters before filter -----------
  # based on user clicking a button to remove a filter that was applied
  def update_filters_stored_in_session
    if session[:size_filters].present? && params[:remove_size_filter].present?
      size_filters = session[:size_filters].split.map(&:to_f)
      filter_to_remove = params[:remove_size_filter].to_f
      filtered = size_filters.filter { |size| size != filter_to_remove }
      session[:size_filters] = filtered.join(' ')
    end
    if session[:color_filters].present? && params[:remove_color_filter].present?
      color_filters = session[:color_filters].split
      filter_to_remove = params[:remove_color_filter].downcase
      filtered = color_filters.filter { |color| color != filter_to_remove }
      session[:color_filters] = filtered.join(' ')
    end
    if session[:brand_filters].present? && params[:remove_brand_filter].present?
      brand_filters = session[:brand_filters].split
      filter_to_remove = params[:remove_brand_filter].downcase
      filtered = brand_filters.filter { |brand| brand != filter_to_remove }
      session[:brand_filters] = filtered.join(' ')
    end
    if session[:category_filters].present? && params[:remove_category_filter].present?
      category_filters = session[:category_filters].split
      filter_to_remove = params[:remove_category_filter].downcase
      filtered = category_filters.filter { |category| category != filter_to_remove }
      session[:category_filters] = filtered.join(' ')
    end
    session[:min_price_filter] = nil if params[:remove_min_price_filter].present?
    session[:max_price_filter] = nil if params[:remove_max_price_filter].present?

    # Fefault sorting if user doesn't select anything
    session[:sort] = 'newest' if session[:sort].nil?
    # Change sorting if user selects something, otherwise keep the same sorting
    session[:sort] = 'high_to_low' if params[:sort_high_to_low].present?
    session[:sort] = 'low_to_high' if params[:sort_low_to_high].present?
    session[:sort] = 'newest' if params[:sort_newest].present?
    return unless params[:sort_highest_discount].present?

    session[:sort] = 'highest_discount'
  end

  # ------------------ Apply Filters ------------------
  def apply_filters(products)
    if session[:size_filters].present? && session[:size_filters].length.positive?
      products = filter_size(products, session[:size_filters].split)
    end

    if session[:color_filters].present? && session[:color_filters].length.positive?
      products = filter_color(products, session[:color_filters].split)
    end
    if session[:brand_filters].present? && session[:brand_filters].length.positive?
      products = filter_brand(products, session[:brand_filters].split)
    end
    if session[:category_filters].present? && session[:category_filters].length.positive?
      products = filter_category(products, session[:category_filters].split)
    end
    puts "session min price filters: #{session[:min_price_filter]}"
    if session[:min_price_filter].present? && session[:min_price_filter].length.positive?
      products = filter_min_price(products, session[:min_price_filter].split.map(&:to_f))
    end
    puts "session max price filter: #{session[:max_price_filter]}"
    if session[:max_price_filter].present? && session[:max_price_filter].length.positive?
      products = filter_max_price(products, session[:max_price_filter].split.map(&:to_f))
    end
    products
  end

  def sort_products(products)
    case session[:sort]
    when 'high_to_low'
      products.sort_by(&:price).reverse
    when 'low_to_high'
      products.sort_by(&:price)
    when 'newest'
      products.sort_by(&:created_at).reverse
    when 'highest_discount'
      products.sort_by(&:discount).reverse
    end
  end
end
