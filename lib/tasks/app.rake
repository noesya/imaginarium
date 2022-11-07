namespace :app do

  desc 'Start server'
  task :start do
    sh 'yarn'
    sh 'rails tmp:cache:clear'
    sh 'rails server'
  end

  task fix: :environment do
    Image.find_each do |image|
      image.prepare unless image.ready?
    end
  end

  desc 'Get DB'
  namespace :db do
    desc 'Get database from Scalingo'
    task :production do
      Bundler.with_unbundled_env do
        Figaro.load # Load ENV variables
        # Get a new backup archive from Scalingo
        # PG Addon ID from `scalingo addons` CLI command.
        sh "scalingo --app #{ENV['SCALINGO_APP']} backups-create --addon #{ENV['SCALINGO_PG_ADDON_ID']}"
        sh "scalingo --app #{ENV['SCALINGO_APP']} backups-download --addon #{ENV['SCALINGO_PG_ADDON_ID']} --output db/scalingo-dump.tar.gz"

        sh 'rm -f db/latest.dump' # Remove an old backup file if it exists
        sh 'tar zxvf db/scalingo-dump.tar.gz -C db/' # Extract the new backup archive
        sh 'rm db/scalingo-dump.tar.gz' # Remove the backup archive
        sh 'mv db/*.pgsql db/latest.dump' # Rename the backup file
        sh 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop'
        sh 'bundle exec rails db:create'
        begin
          sh 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d imaginarium_development db/latest.dump'
        rescue
          'There were some warnings or errors while restoring'
        end
        sh 'rails db:migrate'
        sh 'rails db:seed'
      end
    end
  end
end
