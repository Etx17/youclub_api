SitemapGenerator::Sitemap.default_host = "https://youclub-038022f0913c.herokuapp.com"
SitemapGenerator::Sitemap.create do
  add '/clubs'
  Activity.find_each do |activity|
    add activity_path(activity), lastmod: activity.updated_at
  end
end
