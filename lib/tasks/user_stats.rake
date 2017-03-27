task user_stats: 'kitsu:user_stats_setup'

namespace :kitsu do
  task :user_stats do
    klass = RegenerateStatService

    klass.anime_genre_breakdown
    klass.anime_amount_watched
  end
end