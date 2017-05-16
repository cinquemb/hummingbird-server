class AnidbCategoryImport
  class ImportFile
    attr_reader :data

    def initialize(filename)
      @data = JSON.parse(open(filename).read)
    end

    def apply!
      data.each do |item|
        item = item.deep_symbolize_keys
        puts item[:titles][:canonical].titleize

        category ||= Category.find_by(anidb_id: item[:id]) || Category.new
        category.title ||= item[:titles][:canonical].titleize
        category.description ||= item[:description]
        category.image ||= item[:image]
        category.anidb_id ||= item[:id]
        category.save
      end

      data.each do |item|
        item = item.deep_symbolize_keys
        next unless item[:parent]
        category = Category.find_by(anidb_id: item[:id])
        category_parent = Category.find_by(anidb_id: item[:parent])
        category.parent = category_parent
        category.save
      end
    end
  end

  def run!
    ActiveRecord::Base.logger = Logger.new(nil)
    Chewy.strategy(:bypass)
    filename = File.join(
      File.expand_path(
        File.dirname(__FILE__)
      ),
      'anidb_category.json'
    )
    ImportFile.new(filename).apply! if File.file?(filename)
  end
end
