namespace :kitsu do
  task user_stats: :environment do
    klass = RegenerateStatService

    # Genre Breakdown
    klass.anime_genre_breakdown
    klass.manga_genre_breakdown

    # Amount Watched/Read
    klass.anime_amount_consumed
    klass.manga_amount_consumed

    # Activity History
    klass.anime_activity_history
    klass.manga_activity_history
  end
end
