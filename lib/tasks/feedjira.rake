desc "Fetch news for the categories"

task :news_link_of_category => :environment do

  debugger
  categories = Category.all.order('name ASC').map(&:name)

  categories.each do |category_name|

    url = "http://news.google.com/news?pz=1&ned=us&hl=en&q=#{category_name}&output=RSS"

    feed = Feedjira::Feed.fetch_and_parse(url)

    puts "Category #{category_name}"
    puts "**********************************"

    feed.entries.each.with_index do |entry,index|

      puts '======================================'
      puts "News #{index+1} of #{category_name}"
      puts "Title  " + entry.title
      puts "URL " + entry.url + "\n"

      category = Category.where(name: category_name).first
      news = category.news.where(title: entry.title).first_or_create
      news.update_attributes(url: entry.url)

    end
    puts "*********************************************" + "\n" + "\n"
  end
end
