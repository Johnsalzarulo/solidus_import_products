Spree::ProductImport.settings = {
  num_prods_for_delayed: 20, # From this number of products, the process is executed in delayed_job. Under it is processed immediately.
  create_missing_taxonomies: true,
  taxonomy_fields: [:taxonomies], # Fields that should automatically be parsed for taxons to associate
  image_fields_products: %i[image_product image_product_2 image_product_3 image_product_4], # Image fields that should be parsed for image locations of products
  image_fields_variants: %i[image_variant image_variant_2 image_variant_3 image_variant_4], # Image fields that should be parsed for image locations of variants
  image_text_products: :alt_product, # Field that contains alt text for images of product.
  image_text_variants: :alt_variant, # Field that contains alt text for images of variant.
  product_image_path: "#{Rails.root}/lib/etc/product_data/product-images/", # The location of images on disk
  log_to: File.join(Rails.root, '/log/', "import_products_#{Rails.env}.log"), # Where to log to
  destroy_original_products: false, # Disabled #Delete the products originally in the database after the import?
  first_row_is_headings: true, # Reads column names from first row if set to true.
  create_variants: true, # Compares products and creates a variant if that product already exists.
  price_field: :price, # Field that contains the price of a product. Is required in new products.
  variant_comparator_field: :name, # Which product field to detect duplicates on
  variant_comparator_field_i18n: :namei18n, # CSV column with translation of variant_comparator_field. Not used yet.
  multi_domain_importing: false, # If Spree's multi_domain extension is installed, associates products with store.
  store_field: :store_code, # Which field of the column mappings contains either the store id or store code?
  transaction: true # import product in a sql transaction so we can rollback when an exception is raised
}
